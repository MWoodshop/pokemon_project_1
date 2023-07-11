FactoryBot.define do
  factory :trainer do
    name { 'Brock' }
    region { 'Kanto' }
    generation_introduced { 1 }
    gym_leader { true }
  end
end
