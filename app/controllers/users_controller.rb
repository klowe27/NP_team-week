class UsersController < ApplicationController
  before_action :admin_user

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @orders = @user.orders
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_user_session_path
    else
      render :registrations_new
    end
  end

end
