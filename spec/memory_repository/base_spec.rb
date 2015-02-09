require 'spec_helper'
require 'memory_repository/base'
require 'ostruct'

RSpec.describe MemoryRepository::Base do
  class TestRepository
    extend MemoryRepository::Base

    def not_found
      TestRepository::TestObjectNotFound
    end
  end

  let(:repo) { TestRepository }
  let(:object) do
    OpenStruct.new(lol: 'wut')
  end

  before do
    repo.destroy_all!
  end

  describe TestRepository do
    it 'assigns an ID on save' do
      expect(object.id).to be_nil
      saved = repo.save(object)
      expect(saved.id).to eq(1)
    end

    it 'increments ID for new objects' do
      another_object = OpenStruct.new(rofl: 'copter')
      saved_first  = repo.save(object)
      saved_second = repo.save(another_object)
      expect(saved_first.id).to  eq(1)
      expect(saved_second.id).to eq(2)
    end

    it 'updates attributes on existing objects' do
      saved = repo.save(object)
      expect(saved.lol).to  eq('wut')

      saved.lol = 'rofl'
      updated = repo.save(saved)

      expect(updated.lol).to eq('rofl')
    end

    it 'does not update IDs on existing objects' do
      object.id = 5
      saved = repo.save(object)
      expect(saved.id).to  eq(5)
    end

    it 'finds an object by id' do
      repo.save(object)
      found = repo.find(1)
      expect(found.lol).to eq('wut')
    end

    it 'raises an error if an object is not found' do
      expect{ repo.find(10) }.to raise_error
    end

    it 'deletes an object' do
      repo.save(object)
      deleted = repo.delete(object.id)
      expect{ repo.find(1) }.to raise_error
    end

    it 'returns all objects' do
      another_object = OpenStruct.new(rofl: 'copter')
      repo.save(object)
      repo.save(another_object)
      expect(repo.all).to eq([object, another_object])
    end

  end
end
