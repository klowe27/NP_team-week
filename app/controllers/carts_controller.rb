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

  card = customer.sources.retrieve(charge.source.id)
  current_order.update(
    status: "Complete",
    stripe_id: card.id,
    card_last4: card.last4,
    card_type: card.brand,
    card_exp_month: card.exp_month,
    card_exp_year: card.exp_year
  )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end


end
