class SearchController < ApplicationController
  allow_unauthenticated_access

  def show
    @items = params[:query].present? ? Bgg.search(params[:query], params[:type]) : []
  end
end
