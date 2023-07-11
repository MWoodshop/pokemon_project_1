require 'rails_helper'

RSpec.describe Trainer, type: :model do
  before(:each) do
    @trainer = Trainer.new(id: 1, name: 'Ash', region: 'Kanto', generation_introduced: 1, gym_leader: false)
  end
  it 'exists' do
    expect(@trainer).to be_a Trainer
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :region }
    it { should validate_presence_of :generation_introduced }
    it { should validate_inclusion_of(:gym_leader).in_array([true, false]) }
  end
end
