require 'rails_helper'

RSpec.describe DonationsController, type: :controller do

  describe "GET #nonprofit_name:" do
    it "returns http success" do
      get :nonprofit_name:
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #string," do
    it "returns http success" do
      get :string,
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #date:" do
    it "returns http success" do
      get :date:
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #date," do
    it "returns http success" do
      get :date,
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #amount:" do
    it "returns http success" do
      get :amount:
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #integer," do
    it "returns http success" do
      get :integer,
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #user:" do
    it "returns http success" do
      get :user:
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #string" do
    it "returns http success" do
      get :string
      expect(response).to have_http_status(:success)
    end
  end

end
