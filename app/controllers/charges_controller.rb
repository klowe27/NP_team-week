class ChargesController < ApplicationController
  before_action :set_charge, only: [:show, :edit, :update, :destroy]

  def index

  end

  def new
      @order_items = current_order.order_items
  end

  def create
    # Amount in cents
    @order = current_order
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

    redirect_to order_path(@order)

      rescue Stripe::CardError => e
        flash[:error] = e.message

    end

  private

    def set_charge
      @charge = current_user.charges.find(params[:id])
    end

end
