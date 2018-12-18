class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = Order.all.where(user_id: current_user.id)
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @nonprofits = Nonprofit.all
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

  def admin
    @nonprofits = Nonprofit.all
  end

  # def donations
  #   @order_items = Order_Items.all
  #   @orders = Orders.all
  #   @nonprofit = Nonprofit.find(params[:id])
  #   (params[:nonprofit_id])
  # end

end
