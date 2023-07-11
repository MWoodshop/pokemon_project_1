require 'rails_helper'

RSpec.describe Trainer, type: :model do
  before(:each) do
    @trainer1 = Trainer.new(id: 1, name: 'Ash', region: 'Kanto', generation_introduced: 1, gym_leader: false)
    @trainer2 = Trainer.new(id: 2, name: 'Misty', region: 'Kanto', generation_introduced: 1, gym_leader: false)
    @trainer3 = Trainer.new(id: 3, name: 'Brock', region: 'Kanto', generation_introduced: 1, gym_leader: false)

    @pokemon1 = Pokemon.new(name: 'Pikachu', pokemon_type: 'Electric', height: 1, weight: 13, can_evolve: true,
                            trainer_id: @trainer1.id)
    @pokemon2 = Pokemon.new(name: 'Squirtle', pokemon_type: 'Water', height: 1, weight: 13, can_evolve: true,
                            trainer_id: @trainer2.id)
    @pokemon3 = Pokemon.new(name: 'Charmander', pokemon_type: 'Fire', height: 1, weight: 13, can_evolve: true,
                            trainer_id: @trainer3.id)
  end
  it 'exists' do
    expect(@trainer1).to be_a Trainer
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :region }
    it { should validate_presence_of :generation_introduced }
  end
end

feature 'Trainer Index Page', type: :feature do
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

  # User Story 1
  scenario 'displays all trainers on the /trainers page' do
    visit trainers_path
    expect(page).to have_content(@trainer1.name)
    expect(page).to have_content(@trainer2.name)
    expect(page).to have_content(@trainer3.name)
  end

  # User Story 2
  scenario 'displays trainer by id' do
    visit trainers_path(@trainer1)
    expect(page).to have_content(@trainer1.name)
  end
end
