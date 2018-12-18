class CartsController < ApplicationController

  def show

    @order_items = current_order.order_items
    @order = current_order
    @order.update(user_id: current_user.id)
    # if @order.user_id === current_user.id
    #   flash[:notice] = "Order successfully linked"
    # else
    #   flash[:notice] = "Order not successfully linked"
    # end
  end

  def new
      @order_items = current_order.order_items
  end


  def create
  # Amount in cents
  @amount = current_order.calculate_total_cent

  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'
  )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end


end
