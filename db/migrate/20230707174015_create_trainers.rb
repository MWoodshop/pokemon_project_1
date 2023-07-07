class CreateTrainers < ActiveRecord::Migration[7.0]
  def change
    create_table :trainers do |t|
      t.string :name
      t.string :region
      t.integer :generation_introduced
      t.boolean :gym_leader

      t.timestamps
    end
  end
end
