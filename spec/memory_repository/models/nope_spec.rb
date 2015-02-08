require 'spec_helper'
require 'memory_repository/models/nope'
require 'memory_repository/models/user'
require 'memory_repository/models/product'

RSpec.describe MemoryRepository::Models::Like do
  let(:user) do
    MemoryRepository::Models::User.new(
      email: 'ikea@personal.pizza'
    )
  end
  let(:poang) do
    MemoryRepository::Models::Product.new(
      name: 'POÄNG',
      article_number: 10116552
    )
  end
  let(:nope) do
    described_class.new(
      user_id: user.id,
      product_id: poang.id
    )
  end

  it 'has a user' do
    expect(nope.user_id).to eq(user.id)
  end

  it 'has a product' do
    expect(nope.product_id).to eq(poang.id)
  end

end
