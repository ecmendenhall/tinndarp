require 'memory_repository/memory_repository'
require 'memory_repository/models/like'
require 'memory_repository/base'

module MemoryRepository
  class LikeRepository
    include Base

    def model_class
      MemoryRepository::Models::Like
    end

    def create(attributes = {})
      like = model_class.new(attributes)
      saved = save(like) if where(attributes).empty?
      delete_matching_nope(attributes)
      saved
    end

    def where(attributes)
      exclude = model_class._fields - attributes.keys
      all.select {|like| like.attributes.except(*exclude) == attributes}
    end

    def by_user(id)
      all.select {|like| like.user_id == id }
    end

    def delete_matching_nope(attributes)
      nope_repo = MemoryRepository.nope
      nopes = nope_repo.where(attributes)
      nope_repo.delete(nopes.first.id) unless nopes.empty?
    end
  end
end
