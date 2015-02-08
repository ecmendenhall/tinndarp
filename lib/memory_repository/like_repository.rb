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
      save(like)
    end

    def by_user(id)
      all.select {|like| like.user_id == id }
    end
  end
end
