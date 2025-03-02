class SearchController < ApplicationController
  def show
    @items = params[:query].present? ? Bgg.search(params[:query], params[:type]) : []
  end
end
