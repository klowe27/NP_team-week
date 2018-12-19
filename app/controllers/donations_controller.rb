class DonationsController < ApplicationController


  def index
    @nonprofits = Nonprofit.all
    # @nonprofit = Nonprofit.find(params[:id])

  end

  def show

    @nonprofit = Nonprofit.find(params[:id])
    @nonprofits = Nonprofit.all
    @order_items = OrderItem.where(nonprofit_id: @nonprofit.id )
    # @orders = OrderItem.find.where(@order_items.order_id)
    # @order = OrderItem.where(order_id: order.id)

    # @order = Order.where(id: @order_item.order_id)
    # (params[:nonprofit_id])

  end

end
