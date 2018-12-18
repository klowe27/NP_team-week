require 'rails_helper'

describe User do
  it 'is database authenticable' do
    user = FactoryBot.create(:user)
    expect(user.valid_password?('password123')).to be_truthy
  end
end
