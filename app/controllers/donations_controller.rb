class DonationsController < ApplicationController


  def index
    @nonprofits = Nonprofit.all
    # @nonprofit = Nonprofit.find(params[:id])

  end

  def show
    @nonprofit = Nonprofit.find(params[:id])
    @orders = Order.all
  end

end
