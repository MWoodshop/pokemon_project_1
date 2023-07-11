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

    # Set custom creation timestamps
    @trainer1.update(created_at: Time.zone.parse('2023-07-11 01:48:13 UTC'))
    @trainer2.update(created_at: Time.zone.parse('2023-07-11 01:48:14 UTC'))
    @trainer3.update(created_at: Time.zone.parse('2023-07-11 01:48:15 UTC'))

    @pokemon1 = Pokemon.create(name: 'Pikachu', pokemon_type: 'Electric', height: 1, weight: 13, can_evolve: true,
                               trainer_id: @trainer1.id)
    @pokemon2 = Pokemon.create(name: 'Squirtle', pokemon_type: 'Water', height: 1, weight: 13, can_evolve: true,
                               trainer_id: @trainer2.id)
    @pokemon3 = Pokemon.create(name: 'Charmander', pokemon_type: 'Fire', height: 1, weight: 13, can_evolve: true,
                               trainer_id: @trainer3.id)
  end

  # User Story 1
  scenario 'displays all trainer names on the /trainers page' do
    visit trainers_path
    expect(page).to have_content(@trainer1.name)
    expect(page).to have_content(@trainer2.name)
    expect(page).to have_content(@trainer3.name)
  end

  # User Story 2
  scenario 'displays all trainer attributes by id' do
    visit trainers_path(@trainer1)

    expect(page).to have_content(@trainer1.name)
    expect(page).to have_content(@trainer1.region)
    expect(page).to have_content(@trainer1.generation_introduced)
    expect(page).to have_content(@trainer1.gym_leader)
    expect(page).to have_content(@trainer1.assigned_pokemon_count)
    expect(page).to have_content(@trainer1.created_at.strftime('%Y-%m-%d %H:%M:%S'))
    expect(page).to have_content(@trainer1.updated_at.strftime('%Y-%m-%d %H:%M:%S'))
  end

  # User Story 5
  scenario 'displays each pokemon assigned to a trainer and all of the pokemons attributes' do
    visit assigned_trainer_pokemons_path(@trainer1)

    expect(page).to have_content(@pokemon1.name)
    expect(page).to have_content(@pokemon1.pokemon_type)
    expect(page).to have_content(@pokemon1.height)
    expect(page).to have_content(@pokemon1.weight)
    expect(page).to have_content(@pokemon1.can_evolve)
    expect(page).to have_content(@pokemon1.created_at)
    expect(page).to have_content(@pokemon1.updated_at)
  end

  # User Story 6
  scenario 'trainer index sorted by most recently created' do
    visit trainers_path

    trainer_names = page.all('.trainer-entry b').map(&:text)
    trainer3_index = trainer_names.index(@trainer3.name)
    trainer2_index = trainer_names.index(@trainer2.name)

    expect(trainer3_index).to be < trainer2_index
  end

  # User Story 7
  scenario 'trainer show page shows count of assigned pokemon' do
    visit trainer_path(@trainer1)

    expect(page).to have_content(@trainer1.assigned_pokemon_count)
  end

  # User Story 8
  scenario 'displays links to Welcome, Trainers, and Pokemon Index on Trainer Index page' do
    visit trainers_path

    expect(page).to have_selector('.navbar a', text: 'Main Page')
    expect(page).to have_selector('.navbar a', text: 'Pokemon')
    expect(page).to have_selector('.navbar a', text: 'Trainers')

    click_link 'Main Page'
    expect(current_path).to eq('/')

    # User Story 8
    click_link 'Pokemon'
    expect(current_path).to eq('/pokemons')

    # User Story 9
    click_link 'Trainers'
    expect(current_path).to eq('/trainers')
  end

  scenario 'displays links to Welcome, Trainers, and Pokemon Index on Trainer Edit page' do
    visit trainers_path

    expect(page).to have_selector('.navbar a', text: 'Main Page')
    expect(page).to have_selector('.navbar a', text: 'Pokemon')
    expect(page).to have_selector('.navbar a', text: 'Trainers')

    click_link 'Main Page'
    expect(current_path).to eq('/')

    click_link 'Pokemon'
    expect(current_path).to eq('/pokemons')

    click_link 'Trainers'
    expect(current_path).to eq('/trainers')
  end

  # User Story 10
  scenario 'displays link to trainers pokemon page from trainers show page' do
    visit trainer_path(@trainer1)

    expect(page).to have_link('Assigned Pokemon')
    click_link 'Assigned Pokemon'
    expect(current_path).to eq(assigned_trainer_pokemons_path(@trainer1))
  end

  # Iteration 2
  # User Story 11
  scenario 'on trainer index page, see link to new trainer, click link, and be taken to new trainer form, fill out form and redirect to trainer index page to see new trainer created' do
    visit trainers_path
    expect(page).to have_link('New Trainer')

    click_link 'New Trainer'
    expect(current_path).to eq('/trainers/new')
    expect(page).to have_selector('form')
    fill_in 'trainer_name', with: 'Jessie'
    select 'Galar', from: 'trainer_region'
    fill_in 'trainer_generation_introduced', with: 2
    select 'false', from: 'trainer_gym_leader'
    click_button 'small_button'
    expect(current_path).to eq('/trainers')
    expect(page).to have_content('Jessie')
    expect(page).to have_content('Galar')
    expect(page).to have_content(2)
    expect(page).to have_content('false')
  end

  # User Story 12
  scenario 'on trainer index page, see link to edit trainer, click link, and be taken to edit trainer form, fill out form and redirect to trainer index page to see trainer updated' do
    visit trainer_path(@trainer1)
    expect(page).to have_link('Edit Trainer')
    click_link('Edit Trainer')
  end
end
