class NonprofitsController < ApplicationController
  def index
    @types = Type.all
    @nonprofitss = Nonprofit.search(params[:search])
  end

  def show
    @nonprofit = Nonprofit.find(params[:id])
    @order_item = current_order.order_items.new
  end

end
