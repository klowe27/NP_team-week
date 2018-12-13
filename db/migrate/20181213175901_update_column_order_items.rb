class UpdateColumnOrderItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :order_items, :np_id
    add_column :order_items, :nonprofit_id, :integer
  end
end
