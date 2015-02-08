require 'spec_helper'
require 'memory_repository/like_repository'
require 'memory_repository/models/like'

RSpec.describe MemoryRepository::LikeRepository do
  let(:repo) { described_class.new }

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
end
