class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_item = @order.order_items.new
  end
end
