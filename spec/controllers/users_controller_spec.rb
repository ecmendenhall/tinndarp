require 'spec_helper'
require 'memory_repository/memory_repository'

RSpec.describe UsersController, type: :controller do
  let(:repo) { MemoryRepository.user }
  let(:user1) do
    {
      id: 1,
      email: 'alice@personal.pizza',
    }
  end
  let(:user2) do
    {
      id: 2,
      email: 'bob@personal.pizza',
    }
  end

  before do
    repo.create(user1)
    repo.create(user2)
  end

  describe '#index' do
    it 'returns all users' do
      get :index
      expect(response.body).to eq([user1, user2].to_json)
    end
  end

  describe '#show' do
    it 'returns a user' do
      get :show, id: 2
      expect(response.body).to eq(user2.to_json)
    end
  end
end
