require 'rails_helper'

describe Order do
  it { should have_many :order_items }
  # it { should before_save :update_total }
  # it { should before_create :update_status }
end
