require 'spec_helper'
require 'memory_repository/like_repository'
require 'memory_repository/memory_repository'
require 'memory_repository/models/like'

RSpec.describe MemoryRepository::LikeRepository do
  let(:repo) { described_class.new }
  let(:nope_repo) { MemoryRepository.nope }

  it 'has a model class' do
    expect(repo.model_class).to eq(MemoryRepository::Models::Like)
  end

  it 'creates new models' do
    like = repo.create(user_id: 1, product_id: 2)
    expect(like.user_id).to    eq(1)
    expect(like.product_id).to eq(2)
  end

  it 'saves new models' do
    like = repo.create(user_id: 1, product_id: 2)
    found = repo.find(like.id)
    expect(found).to eq(like)
  end

  it 'finds likes by user' do
    like1 = repo.create(user_id: 1, product_id: 2)
    like2 = repo.create(user_id: 1, product_id: 3)
    repo.create(user_id: 2, product_id: 3)
    expect(repo.by_user(1)).to eq([like1, like2])
  end

  it 'rejects existing likes' do
    repo.create(user_id: 1, product_id: 2)
    repo.create(user_id: 1, product_id: 2)
    expect(repo.by_user(1).length).to eq(1)
  end

  it 'finds likes by attributes' do
    repo.create(user_id: 1, product_id: 2)
    expect(repo.where(product_id: 2).length).to eq(1)
  end

  it 'deletes nopes that match like attributes' do
    nope_repo.create(user_id: 1, product_id: 2)
    repo.create(user_id: 1, product_id: 2)
    nopes = nope_repo.by_user(1)
    expect(nopes).to be_empty
  end
end
