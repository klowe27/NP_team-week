class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order

  def current_order
    if session[:order_id]
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

    private
    def admin_user
      redirect_to root_path, alert: 'Access Denied, Admin Only!' unless current_user && current_user.admin?
    end
end
