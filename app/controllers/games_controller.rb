class GamesController < ApplicationController
  allow_unauthenticated_access only: %i[show]

  before_action :set_game, only: %i[show]
  before_action :set_lists, only: %i[show], if: -> { authenticated? }

  def show
  end

  private

  def set_game
    @game = Game.find_or_create_by(bgg_id: params[:id]) do |game|
      bgg_game = Bgg.thing(params[:id])

      game.bgg_type = bgg_game[:type]
      game.name = bgg_game[:name]
      game.thumbnail = bgg_game[:thumbnail]
      game.description = bgg_game[:description]
      game.yearpublished = bgg_game[:yearpublished]
      game.minplayers = bgg_game[:minplayers]
      game.maxplayers = bgg_game[:maxplayers]
      game.playingtime = bgg_game[:playingtime]
      game.minplaytime = bgg_game[:minplaytime]
      game.maxplaytime = bgg_game[:maxplaytime]
      game.minage = bgg_game[:minage]
      game.categories = bgg_game[:categories]
      game.mechanics = bgg_game[:mechanics]
      game.expansions = bgg_game[:expansions]
      game.designers = bgg_game[:designers]
      game.artists = bgg_game[:artists]
      game.publishers = bgg_game[:publishers]
    end
  end

  def set_lists
    @lists = Current.user.lists.where.not(id: @game.listings.pluck(:list_id))
  end
end
