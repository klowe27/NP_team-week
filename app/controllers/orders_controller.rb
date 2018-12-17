class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_item = @order.order_items.new
  end

  def create
    @order = current_order
    session[:order_id] = @order.id
    session[:user_id] = @user.id
    @user = current_user
    @order.user_id = @user.id
    redirect_to cart_path
  end

end
