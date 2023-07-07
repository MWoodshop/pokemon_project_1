class CreatePokemons < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :type
      t.string :trainer
      t.integer :height
      t.integer :weight
      t.boolean :can_evolve

      t.timestamps
    end
  end
end
