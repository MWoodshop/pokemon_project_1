class Pokemon < ApplicationRecord
  belongs_to :trainer

  validates :name, presence: true
  validates :pokemon_type, presence: true
  validates :trainer, presence: true
  validates :height, presence: true
  validates :weight, presence: true
  validates :can_evolve, inclusion: { in: [true, false] }
end
