require 'spec_helper'
require 'memory_repository/models/user'

RSpec.describe MemoryRepository::Models::User do
  let(:user) do
    described_class.new(
      email: 'ikea@personal.pizza',
    )
  end

  it 'has an email' do
    expect(user.email).to eq('ikea@personal.pizza')
  end

end
