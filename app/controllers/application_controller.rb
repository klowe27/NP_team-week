class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order

  def current_order
    Order.find(1)
    # if session[:order_id]
    #   Order.find(session[:order_id])
    # else
    #   Order.new
    # end
  end
end
