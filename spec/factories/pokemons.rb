FactoryBot.define do
  factory :pokemon do
    name { 'Pikachu' }
    pokemon_type { 'Electric' }
    can_evolve { true }
    height { 1 }
    weight { 13 }
    association :trainer, factory: :trainer
  end
end
