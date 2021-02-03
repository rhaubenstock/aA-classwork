class Api::PokemonController < ApplicationController

  def index
    @all_pokemon = Pokemon.all
    # render :index # <- could write in but unnecessary
  end

  def show
    @pokemon = Pokemon.find_by(id: params[:id])
    # render :show # <- could write in but unnecessary
  end
end
