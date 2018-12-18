class OrdersController < ApplicationController


  def index
    @order = current_order
    @orders = Order.where("user_id= #{current_user.id}")
  end

  def show
    @order = Order.find(params[:id])
    respond_to do |format|
      format.html
      format.json
      format.pdf {
        send_data @order.receipt.render,
          filename: "#{@order.created_at.strftime("%Y-%m-%d")}-gorails-receipt.pdf",
          type: "application/pdf",
          disposition: :inline
      }
      session.delete(:order_id)
    end

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
