class SearchController < ApplicationController
  def index
    if params[:search]
    @nonprofit = Nonprofit.where('name LIKE ?', "%#{params[:search]}%" )
  else
    @nonprofit = Nonprofit.all
    end
  end

end
