class Trainer < ApplicationRecord
  has_many :pokemons, dependent: :destroy

  validates :name, presence: true
  validates :region, presence: true
  validates :generation_introduced, presence: true
  validates :gym_leader, inclusion: { in: [true, false] }
end
