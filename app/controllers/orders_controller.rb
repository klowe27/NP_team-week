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

  end

  def create
    # @order = current_order
    # session[:order_id] = @order.id
    # session[:user_id] = @user.id
    # @user = current_user
    # @order.user_id = @user.id
    # redirect_to cart_path
  end



end
