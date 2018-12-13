class NonprofitsController < ApplicationController
  def index
    @types = Type.all
  end

  def show
    @nonprofit = Nonprofit.find(params[:id])
    @order_item = current_order.order_items.new
  end
end
