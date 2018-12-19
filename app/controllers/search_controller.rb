class SearchController < ApplicationController
  def index
    @nonprofits = Nonprofit.search(params[:search])
  end

end
