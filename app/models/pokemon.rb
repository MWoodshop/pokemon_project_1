class Pokemon < ApplicationRecord
  belongs_to :trainer

  validates :name, presence: true
  validates :pokemon_type, presence: true
  validates :trainer_id, presence: true
  validates :height, presence: true
  validates :weight, presence: true
  validates :can_evolve, inclusion: { in: [true, false] }

  scope :true_pokemon, -> { where(can_evolve: true) }
  scope :false_pokemon, -> { where(can_evolve: false) }
end
