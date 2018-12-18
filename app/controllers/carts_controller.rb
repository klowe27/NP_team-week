class CartsController < ApplicationController

  def show
    @order = current_order
    @order.save

    @order_items = current_order.order_items
    if current_user && current_order.order_items.length > 0
      @order.update(user_id: current_user.id)
    end
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
