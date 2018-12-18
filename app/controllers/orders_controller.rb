class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = Order.all.where(user_id: current_user.id)
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    # @order_item = @order.order_items.new
  end

  def create
    @order = current_order
    session[:order_id] = @order.id
    session[:user_id] = @user.id
    @user = current_user
    @order.user_id = @user.id
    redirect_to cart_path
  end

  # def user_orders
  #   @all_user_orders = Order.user_orders
  # end

end
