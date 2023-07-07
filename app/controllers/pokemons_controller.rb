class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
  end

  def new; end

  def create
    pokemon = Pokemon.new(pokemon_params)
    pokemon.save

    redirect_to '/pokemons'
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def edit
    @pokemon = Pokemon.find_by(id: params[:id])
    return if @pokemon

    redirect_to root_path, alert: 'Pokemon not found'
  end

  def update
    pokemon = Pokemon.find(params[:id])
    pokemon.update({
                     name: params[:pokemon][:name],
                     pokemon_type: params[:pokemon][:pokemon_type],
                     trainer: params[:pokemon][:trainer],
                     height: params[:pokemon][:height],
                     weight: params[:pokemon][:weight],
                     can_evolve: params[:pokemon][:can_evolve]
                   })
    redirect_to "/pokemons/#{pokemon.id}"
  end

  def destroy
    Pokemon.destroy(params[:id])
    redirect_to '/pokemons'
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:name, :pokemon_type, :trainer, :height, :weight, :can_evolve)
  end
end
