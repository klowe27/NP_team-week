class NonprofitsController < ApplicationController
  def index
    @types = Type.all
  end

  def show
    @nonprofit = Nonprofit.find(params[:id])
    @order_item = current_order.order_items.new
  end

  # def self.search(name_parameter)
  #   where("name like ?", "%#{name_parameter}%")
  # end

end
