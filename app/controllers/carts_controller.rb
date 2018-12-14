class CartsController < ApplicationController

  def show
    @order_items = current_order.order_items
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

# PUBLISHABLE_KEY=pk_test_TYooMQauvdEDq54NiTphI7jx \
# SECRET_KEY=sk_test_4eC39HqLyjWDarjtT1zdp7dc rails s
