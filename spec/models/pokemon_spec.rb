require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  before(:each) do
    @pokemon = Pokemon.new(name: 'Pikachu', pokemon_type: 'Electric', height: 1, weight: 13, can_evolve: true,
                           trainer_id: 1)
  end
  it 'exists' do
    pokemon = Pokemon.new
    expect(pokemon).to be_a Pokemon
  end
end
