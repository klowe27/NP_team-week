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
      product: "Charity Frog",
      company: {
        name: "Charity Frog",
        address: "400 SW 6th Ave\n#800\nPortland, OR 97204",
        email: "students@epicodus.com",
      },
      line_items: [
        ["Date",           created_at.strftime("%Y-%m-%d")],
        ["Account Billed", "#{user.email}"],
        ["Product",        "#{self.order_items.collect  { |item| item.nonprofit.name}.join("\n")}"],
        ["Amount",         "$#{self.order_items.collect { |item| item.amount }.sum}.00"],
        ["Charged to",     "#{card_type} (**** **** **** #{card_last4})"],
      ],
      font: {
        bold: Rails.root.join('app/assets/fonts/thasadith/Thasadith-Bold.ttf'),
        normal: Rails.root.join('app/assets/fonts/thasadith/Thasadith-Regular.ttf'),
      }
    )
  end

  scope :user_orders, -> { where(user_id: user.id)}

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
