require 'spec_helper'
require 'memory_repository/memory_repository'

RSpec.describe MatchesController, type: :controller do
  let(:repo) { MemoryRepository.like }

  before do
    repo.create(id: 1, user_id: 1, product_id: 2)
    repo.create(id: 2, user_id: 1, product_id: 3)
    repo.create(id: 3, user_id: 2, product_id: 3)
  end

  describe '#index' do
    it 'returns all matches by user' do
      get :index, user_id: 1, match_id: 2
      expect(response.body).to eq({product_ids: [3]}.to_json)
    end
  end
end
