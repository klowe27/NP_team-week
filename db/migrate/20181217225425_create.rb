class Create < ActiveRecord::Migration[5.2]
  def change
    create_table "charges", force: :cascade do |t|
      t.string   "stripe_id"
      t.string   "amount"
      t.string   "card_last4"
      t.string   "card_type"
      t.string   "card_exp_month"
      t.string   "card_exp_year"
      t.datetime "created_at",      null: false
      t.datetime "updated_at",      null: false
      t.integer  "user_id"
    end
  end
end
