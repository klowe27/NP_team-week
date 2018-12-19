class DonationsController < ApplicationController
  before_action :admin_user

  def index
    @nonprofits = Nonprofit.all
    # @nonprofit = Nonprofit.find(params[:id])

  end

  def show
    @nonprofit = Nonprofit.find(params[:id])
    @orders = Order.all
  end

end
