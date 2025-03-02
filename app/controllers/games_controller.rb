class GamesController < ApplicationController
  def show
    @game = Bgg.thing(params[:id])
  end
end
