require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  before(:each) do
    @trainer = Trainer.new(id: 1, name: 'Ash', region: 'Kanto', generation_introduced: 1,
                           gym_leader: false)
    @pokemon = Pokemon.new(name: 'Pikachu', pokemon_type: 'Electric', height: 1, weight: 13, can_evolve: true,
                           trainer_id: 1)
  end
  it 'exists' do
    expect(@pokemon).to be_a Pokemon
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :pokemon_type }
    it { should validate_presence_of :height }
    it { should validate_presence_of :weight }
  end

  # Tests the foreign key constraint
  describe 'associations' do
    it { should belong_to :trainer }
  end
end

feature 'Pokemon Index Page', type: :feature do
  before(:each) do
    @trainer1 = Trainer.create(id: 1, name: 'Ash', region: 'Kanto', generation_introduced: 1, gym_leader: false)
    @trainer2 = Trainer.create(id: 2, name: 'Misty', region: 'Kanto', generation_introduced: 1, gym_leader: false)
    @trainer3 = Trainer.create(id: 3, name: 'Brock', region: 'Kanto', generation_introduced: 1, gym_leader: false)

    @pokemon1 = Pokemon.create(name: 'Pikachu', pokemon_type: 'Electric', height: 1, weight: 13, can_evolve: true,
                               trainer_id: @trainer1.id)
    @pokemon2 = Pokemon.create(name: 'Squirtle', pokemon_type: 'Water', height: 1, weight: 13, can_evolve: true,
                               trainer_id: @trainer2.id)
    @pokemon3 = Pokemon.create(name: 'Charmander', pokemon_type: 'Fire', height: 1, weight: 13, can_evolve: true,
                               trainer_id: @trainer3.id)
  end

  scenario 'displays all trainers on the /trainers page' do
    visit pokemons_path
    expect(page).to have_content(@pokemon1.name)
    expect(page).to have_content(@trainer2.name)
    expect(page).to have_content(@trainer3.name)
  end
end
