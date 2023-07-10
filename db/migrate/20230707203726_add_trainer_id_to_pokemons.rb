class AddTrainerIdToPokemons < ActiveRecord::Migration[7.0]
  def change
    add_reference :pokemons, :trainer, null: false

    add_foreign_key :pokemons, :trainers
  end
end
