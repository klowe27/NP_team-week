class SearchController < ApplicationController
  def index
    if params[:search]
    @nonprofit = Nonprofit.where('name LIKE ?', "%#{search}%" )
    end
  end

end
