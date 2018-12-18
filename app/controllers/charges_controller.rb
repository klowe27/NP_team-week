class ChargesController < ApplicationController
  before_action :set_charge, only: [:show, :edit, :update, :destroy]

  def index

  end

  def new
      @order_items = current_order.order_items
      redirect_to
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


  def show
      binding.pry
    respond_to do |format|
      format.pdf {
        send_data @charge.receipt.render,
          filename: "#{@charge.created_at.strftime("%Y-%m-%d")}-gorails-receipt.pdf",
          type: "application/pdf",
          disposition: :inline
      }

        session.delete(:order_id)
    end

  end

  private

    def set_charge
      @charge = current_user.charges.find(params[:id])
    end

end
