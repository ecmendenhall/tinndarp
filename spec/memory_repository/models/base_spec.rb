require 'spec_helper'
require 'memory_repository/models/base'

RSpec.describe MemoryRepository::Models::Base do

  class TestModel < MemoryRepository::Models::Base
    data_attributes :lol, :wut
  end

  before do
    TestModel.class_variable_set(:@@id, 0)
  end

  describe TestModel do
    it 'creates getter/setter methods for data attributes' do
      model = TestModel.new
      expect(model).to respond_to(:lol)
      expect(model).to respond_to(:wut)
      expect(model).to respond_to(:lol=)
      expect(model).to respond_to(:wut=)
    end

    it 'sets attributes to the values passed in' do
      model = TestModel.new(lol: 'rofl', wut: 'huh')
      expect(model.lol).to eq('rofl')
      expect(model.wut).to eq('huh')
    end

    it 'returns its attributes' do
      model = TestModel.new(lol: 'rofl', wut: 'huh')
      expect(model.attributes).to eq({
        id: nil,
        lol: 'rofl',
        wut: 'huh'
      })
    end
  end
end
