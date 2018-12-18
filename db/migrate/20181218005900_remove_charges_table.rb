class RemoveChargesTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :charges
  end
end
