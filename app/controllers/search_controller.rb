class SearchController < ApplicationController
  def index
    @nonprofits = Nonprofits.search(params[:search])

    @types = Type.all
    @nonprofit = Nonprofit.all
    # if params[:search]
    #   @nonprofit = Nonprofit.search(params[:search]).order("created_at DESC")
    # else
    #   @nonprofit = Nonprofit.all.order("created_at DESC")
     # end
  end

  def search
    if params[:search].blank?
      redirect_to(root_path, alert: "Empty search field!") and return
    else
    end 
  end


end
