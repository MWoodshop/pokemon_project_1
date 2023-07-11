require 'rails_helper'

RSpec.describe Trainer, type: :model do
  before(:each) do
    @trainer = Trainer.new(name: 'Ash', region: 'Kanto', generation_introduced: 1, gym_leader: false)
  end
  it 'exists' do
    trainer = Trainer.new
    expect(trainer).to be_a Trainer
  end
end
