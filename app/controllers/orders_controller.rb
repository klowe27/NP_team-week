class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @order = current_order
    #doublecheck
    @orders = Order.where(["user_id = ? and status = ?", current_user.id, "Complete"])
#
  end

  def show
    @order = Order.find(params[:id])
    @order.update(user_id: current_user.id)
    respond_to do |format|
      format.html
      format.json
      format.pdf {
        send_data @order.receipt.render,
          filename: "#{@order.created_at.strftime("%Y-%m-%d")}-gorails-receipt.pdf",
          type: "application/pdf",
          disposition: :inline
      }
      if current_order.id === @order.id
        session.delete(:order_id)
      end
    end

    @order_items = @order.order_items
<<<<<<< HEAD
    @nonprofits = Nonprofit.all
    # @order_item = @order.order_items.new
=======

>>>>>>> master
  end

  def create
    # @order = current_order
    # session[:order_id] = @order.id
    # session[:user_id] = @user.id
    # @user = current_user
    # @order.user_id = @user.id
    # redirect_to cart_path
  end

<<<<<<< HEAD
  def admin
    @nonprofits = Nonprofit.all
  end

  # def donations
  #   @order_items = Order_Items.all
  #   @orders = Orders.all
  #   @nonprofit = Nonprofit.find(params[:id])
  #   (params[:nonprofit_id])
  # end
=======

>>>>>>> master

end
