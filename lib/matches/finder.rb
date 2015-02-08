require 'memory_repository/memory_repository'

module Matches
  class Finder
    def self.for_users(user, match)
      new.for_users(user, match)
    end

    def for_users(user, match)
      user_likes  = likes.by_user(user).map(&:product_id)
      match_likes = likes.by_user(match).map(&:product_id)
      user_likes & match_likes
    end

    private

    def likes
      @likes ||= MemoryRepository.like
    end
  end
end
