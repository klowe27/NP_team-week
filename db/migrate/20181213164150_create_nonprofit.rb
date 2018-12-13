class CreateNonprofit < ActiveRecord::Migration[5.2]
  def change
    create_table :nonprofits do |t|
      t.column :name, :string
      t.column :info, :string
      t.column :website, :string
      t.column :type_id, :integer
      t.column :image, :string
      

      t.timestamps
    end
  end
end
