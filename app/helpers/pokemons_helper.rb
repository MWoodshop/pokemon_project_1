module PokemonsHelper
  def assigned_trainer_pokemons_path(trainer)
    "/trainers/#{trainer[:trainer_id]}/pokemons/assigned"
  end
end
