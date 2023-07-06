class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
  end

  def new; end

  def create
    pokemon = Pokemon.new({
                            title: params[:pokemon][:title],
                            description: params[:pokemon][:description]
                          })

    pokemon.save

    redirect_to '/pokemons'
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def edit
    @pokemon = Pokemon.find(params[:id])
  end

  def update
    pokemon = Pokemon.find(params[:id])
    pokemon.update({
                     title: params[:pokemon][:title],
                     description: params[:pokemon][:description]
                   })
    pokemon.save
    redirect_to "/pokemons/#{pokemon.id}"
  end

  def destroy
    Pokemon.destroy(params[:id])
    redirect_to '/pokemons'
  end
end
