class OrderItemsController < ApplicationController

  def create
    @order = current_order
    @item = @order.order_items.new(item_params)
    @order.save
    session[:order_id] = @order.id
    @user = current_user

    if @user == nil
      redirect_to new_user_session_path and return
    end
    redirect_to cart_path
  end

  def destroy
   @order = current_order
   @item = @order.order_items.find(params[:id])
   @item.destroy
   @order.save
   redirect_to cart_path
 end

  private

  def item_params
    params.require(:order_item).permit(:amount, :nonprofit_id)
  end
end
