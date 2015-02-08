require 'spec_helper'
require 'memory_repository/nope_repository'
require 'memory_repository/models/nope'

RSpec.describe MemoryRepository::NopeRepository do
  let(:repo) { described_class.new }

  it 'has a model class' do
    expect(repo.model_class).to eq(MemoryRepository::Models::Nope)
  end

  it 'creates new models' do
    nope = repo.create(user_id: 1, product_id: 2)
    expect(nope.user_id).to    eq(1)
    expect(nope.product_id).to eq(2)
  end

  it 'saves new models' do
    nope = repo.create(user_id: 1, product_id: 2)
    found = repo.find(nope.id)
    expect(found).to eq(nope)
  end

  it 'finds likes by user' do
    nope1 = repo.create(user_id: 1, product_id: 2)
    nope2 = repo.create(user_id: 1, product_id: 3)
    repo.create(user_id: 2, product_id: 3)
    expect(repo.by_user(1)).to eq([nope1, nope2])
  end
end
