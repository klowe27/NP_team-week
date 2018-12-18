class NonprofitsController < ApplicationController
  def index
    @nonprofits =Nonprofits.search(params[:search])

    @types = Type.all
    @nonprofit = Nonprofit.all
    # if params[:search]
    #   @nonprofit = Nonprofit.search(params[:search]).order("created_at DESC")
    # else
    #   @nonprofit = Nonprofit.all.order("created_at DESC")
     # end
  end

  def show
    @nonprofit = Nonprofit.find(params[:id])
    @order_item = current_order.order_items.new
  end

  # def self.search(name_parameter)
  #   where("name like ?", "%#{name_parameter}%")
  # end

end
