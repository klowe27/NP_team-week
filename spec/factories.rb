FactoryBot.define do
  factory :admin do
    
  end
  factory(:user) do
    email { 'test@email.com' }
    password { 'password123' }
  end

  factory(:order) do
    association :order_item
    # before(:create)  { |order| update_status(order) }
    # before(:save) { |order| update_total(order) }
  end

  factory(:order_item) do
    association :nonprofit
    association :order
  end

  factory(:nonprofit) do
    association :order_item
    association :type
    name { 'Charity' }
    info { 'give us money' }
  end

  factory(:type) do
    association :nonprofit
  end


end
