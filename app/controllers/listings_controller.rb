class ListingsController < ApplicationController
  before_action :ensure_list_ownership, only: :create
  before_action :set_listable, only: :create
  before_action :set_listing, only: :destroy

  def create
    @listing = Listing.new(list: @list, listable: @listable)

    if @listing.save
      flash[:notice] = "Added to list"
    else
      flash[:alert] = "Failed to add to list"
    end

    redirect_to @listable
  end

  def destroy
    @listing.destroy!

    redirect_to request.referer || @listing.listable
  end

  private

  def listing_params
    params.expect(listing: [ :list_id ])
  end

  def ensure_list_ownership
    @list = Current.user.lists.find(listing_params[:list_id])
  end

  def set_listable
    @listable = if params[:game_id]
      Game.find(params[:game_id])
    end
  end

  def set_listing
    @listing = Current.user.listings.find(params[:id])
  end
end
