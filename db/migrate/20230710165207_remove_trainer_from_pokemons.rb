class RemoveTrainerFromPokemons < ActiveRecord::Migration[7.0]
  def change
    remove_column :pokemons, :trainer, :string
  end
end
