class UpdateOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :stripe_id, :string
    add_column :orders, :card_last4, :string
    add_column :orders, :card_type, :string
    add_column :orders, :card_exp_month, :string
    add_column :orders, :card_exp_year, :string
  end
end
