class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @order = current_order
    @orders = Order.where(["user_id = ? and status = ?", current_user.id, "Complete"])
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
    @nonprofits = Nonprofit.all
  end

  def admin
    @nonprofits = Nonprofit.all

  end

  def donations
    @nonprofit = Nonprofit.find(params[:id])
    @nonprofits = Nonprofit.all
  end

end
