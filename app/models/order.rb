class Order < ApplicationRecord
  has_many :order_items
  before_save :update_total
  before_create :update_status
  belongs_to :user, optional:true

  def calculate_total
    self.order_items.collect { |item| item.amount }.sum
  end

  def calculate_total_cent
  self.order_items.collect { |item| item.amount }.sum * 100
end

def receipt
    Receipts::Receipt.new(
      id: id,
      subheading: "RECEIPT FOR ORDER #%{id}",
      product: "GoRails",
      company: {
        name: "One Month, Inc.",
        address: "37 Great Jones\nFloor 2\nNew York City, NY 10012",
        email: "teachers@onemonth.com",
      },
      line_items: [
        ["Date",           created_at.to_s],
        ["Account Billed", "#{current_user.name}"],
        ["Product",        "NP"],
        ["Amount",         "$#{self.order_items.collect { |item| item.amount }.sum}.00"],
        ["Charged to",     "#{card_type} (**** **** **** #{card_last4})"],
      ],
    )
  end


  private

  def update_status
    if self.status == nil?
      self.status = "In progress"
    end
  end

  def update_total
    self.total = calculate_total
  end

end
