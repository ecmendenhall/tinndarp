require 'spec_helper'
require 'memory_repository/memory_repository'

RSpec.describe LikesController, type: :controller do
  let(:repo) { MemoryRepository.like }
  let(:like1) do
    { id: 1,
      user_id: 1,
      product_id: 1 }
  end
  let(:like2) do
    { user_id: 2,
      product_id: 2 }
  end

  before do
    repo.create(like1)
    repo.create(like2)
  end

  describe '#index' do
    it 'returns all likes by user' do
      get :index, user_id: 1
      expect(response.body).to eq([like1].to_json)
    end
  end

  describe '#create' do
    it 'creates a new like associated with the user' do
      post :create, user_id: 1, product_id: 1
      likes = repo.by_user(1)
      expect(likes).not_to be_empty
    end

    it 'returns the new like associated with the user' do
      post :create, user_id: 1, product_id: 2
      expect(JSON.parse response.body).to include({'user_id' => 1, 'product_id' => 2})
    end
  end
end
