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
    pokemon.update(pokemon_params)
    redirect_to "/pokemons/#{pokemon.id}"
  end

  def destroy
    Pokemon.destroy(params[:id])
    redirect_to '/pokemons'
  end

  def new_for_trainer
    @trainer = Trainer.find(params[:trainer_id])
    @pokemon = @trainer.pokemons.build
  end

  def create_for_trainer
    @trainer = Trainer.find(params[:trainer_id])
    @pokemon = @trainer.pokemons.build(pokemon_params)
    if @pokemon.save
      redirect_to trainer_path(@trainer), notice: 'Pokemon was successfully created.'
    else
      render :new_for_trainer
    end
  end

  def assigned_pokemons
    @trainer = Trainer.find(params[:trainer_id])
    @pokemons = @trainer.pokemons
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:name, :pokemon_type, :height, :weight, :can_evolve, :trainer_id)
  end
end
