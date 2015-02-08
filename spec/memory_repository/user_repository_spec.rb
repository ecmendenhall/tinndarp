require 'spec_helper'
require 'memory_repository/user_repository'
require 'memory_repository/models/user'

RSpec.describe MemoryRepository::UserRepository do
  let(:repo) { described_class.new }

  it 'has a model class' do
    expect(repo.model_class).to eq(MemoryRepository::Models::User)
  end

  it 'creates new models' do
    user = repo.create(email: 'alice@personal.pizza')
    expect(user.email).to eq('alice@personal.pizza')
  end

  it 'saves new models' do
    user = repo.create(email: 'alice@personal.pizza')
    found = repo.find(user.id)
    expect(found).to eq(user)
  end
end
