require 'rails_helper'

describe Nonprofit do
  it { should have_many :order_items }
  it { should belong_to :type }
  it { should validate_presence_of :name }
  it { should validate_presence_of :info }
end
