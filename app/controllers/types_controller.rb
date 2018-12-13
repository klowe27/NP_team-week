class TypesController < ApplicationController
  def index
    @types = Type.all
  end

  def show
    @type = Type.find(params[:id])
    @order_item = current_order.order_items.new
  end
end
