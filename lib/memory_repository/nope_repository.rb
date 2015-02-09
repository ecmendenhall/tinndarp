require 'memory_repository/models/nope'
require 'memory_repository/base'

module MemoryRepository
  class NopeRepository
    include Base

    def model_class
      MemoryRepository::Models::Nope
    end

    def create(attributes = {})
      like = model_class.new(attributes)
      saved = save(like) if where(attributes).empty?
      delete_matching_like(attributes)
      saved
    end

    def where(attributes)
      exclude = model_class._fields - attributes.keys
      all.select {|nope| nope.attributes.except(*exclude) == attributes}
    end

    def by_user(id)
      all.select {|like| like.user_id == id }
    end

    def delete_matching_like(attributes)
      like_repo = MemoryRepository.like
      likes = like_repo.where(attributes)
      like_repo.delete(likes.first.id) unless likes.empty?
    end
  end
end
