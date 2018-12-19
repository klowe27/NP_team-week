class DonationsController < ApplicationController
  before_action :admin_user

  def index
    @nonprofits = Nonprofit.all
  end

  def show
    @nonprofit = Nonprofit.find(params[:id])
    @orders = Order.all
  end

end
