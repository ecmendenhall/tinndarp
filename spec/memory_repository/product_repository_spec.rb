require 'spec_helper'
require 'memory_repository/product_repository'
require 'memory_repository/models/product'

RSpec.describe MemoryRepository::ProductRepository do
  let(:repo) { described_class.new }

  it 'has a model class' do
    expect(repo.model_class).to eq(MemoryRepository::Models::Product)
  end

  it 'creates new models' do
    product = repo.create(name: 'POÄNG', article_number: 10116552)
    expect(product.name).to eq('POÄNG')
    expect(product.article_number).to eq(10116552)
  end

  it 'saves new models' do
    product = repo.create(name: 'POÄNG', article_number: 10116552)
    found = repo.find(product.id)
    expect(found).to eq(product)
  end

  it 'samples products at random' do
    product = repo.create(name: 'POÄNG', article_number: 10116552)
    found = repo.sample
    expect(found).to eq(product)
  end
end
