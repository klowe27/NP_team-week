class SearchController < ApplicationController
  def index
    if params[:search]
    @search = Nonprofit.search(:search)
    end
  end

end
