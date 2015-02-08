require 'spec_helper'
require 'memory_repository/memory_repository'

RSpec.describe ProductsController, type: :controller do
  let(:repo) { MemoryRepository.product }
  let(:product1) do
    {
      id: 1,
      article_number: 1,
      description: 'product1',
      name: 'product1'
    }
  end
  let(:product2) do
    {
      id: 2,
      article_number: 2,
      description: 'product1',
      name: 'product2'
    }
  end

  before do
    repo.create(product1)
    repo.create(product2)
  end

  describe '#index' do
    it 'returns all products' do
      get :index
      expect(response.body).to eq([product1, product2].to_json)
    end
  end

  describe '#show' do
    it 'returns one products' do
      get :show, id: 1
      expect(JSON.parse response.body).to include('article_number' => 1, 'name' => 'product1')
    end
  end
end
