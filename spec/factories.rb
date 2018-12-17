FactoryBot.define do
  factory :user do
    email('test@email.com')
    password('password123')
  end
  
  factory :order do
    before(:create)  { |order| update_status(order) }
    before(:save) { |order| update_total(order) }
  end
end
