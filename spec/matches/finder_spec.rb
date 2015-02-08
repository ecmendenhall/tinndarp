require 'spec_helper'
require 'matches/finder'
require 'memory_repository/memory_repository'

RSpec.describe Matches::Finder do
  before do
    repo = MemoryRepository.like
    repo.create(user_id: 1, product_id: 1)
    repo.create(user_id: 1, product_id: 2)
    repo.create(user_id: 1, product_id: 3)
    repo.create(user_id: 2, product_id: 2)
    repo.create(user_id: 2, product_id: 3)
  end

  it 'finds matching likes for two users' do
    expect(described_class.for_users(1, 2)).to eq([2, 3])
  end
end
