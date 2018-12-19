class CreateFavoritesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.column :nonprofit_id, :integer
      t.column :user_id, :integer

    t.timestamps
    end
  end
end
