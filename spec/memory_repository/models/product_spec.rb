require 'spec_helper'
require 'memory_repository/models/product'

RSpec.describe MemoryRepository::Models::Product do
  let(:poang) do
    described_class.new(
      name: 'POÄNG',
      article_number: 10116552
    )
  end

  it 'has a name' do
    expect(poang.name).to eq('POÄNG')
  end

  it 'has an article number' do
    expect(poang.article_number).to eq(10116552)
  end

  it 'has a catalog url' do
    expect(poang.catalog_url).to eq('http://www.ikea.com/us/en/catalog/products/10116552/')
  end

end
