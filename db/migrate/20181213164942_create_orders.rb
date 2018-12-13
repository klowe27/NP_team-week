class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.column :user_id, :integer
      t.column :total, :integer
      

    t.timestamps
    end
  end
end
