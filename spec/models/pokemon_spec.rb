require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  before(:each) do
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
    it { should validate_presence_of :trainer_id }
    it { should validate_inclusion_of(:can_evolve).in_array([true, false]) }
  end
end
