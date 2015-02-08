require 'spec_helper'
require 'memory_repository/memory_repository'

RSpec.describe NopesController, type: :controller do
  let(:repo) { MemoryRepository.nope }
  let(:nope1) do
    { id: 1,
      user_id: 1,
      product_id: 1 }
  end
  let(:nope2) do
    { user_id: 2,
      product_id: 2 }
  end

  before do
    repo.create(nope1)
    repo.create(nope2)
  end

  describe '#index' do
    it 'returns all nopes by user' do
      get :index, user_id: 1
      expect(response.body).to eq([nope1].to_json)
    end
  end

  describe '#create' do
    it 'creates a new nope associated with the user' do
      post :create, user_id: 1, product_id: 1
      nopes = repo.by_user(1)
      expect(nopes).not_to be_empty
    end
  end
end
