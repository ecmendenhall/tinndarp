require 'memory_repository/models/user'
require 'memory_repository/base'

module MemoryRepository
  class UserRepository
    include Base

    def model_class
      MemoryRepository::Models::User
    end

    def create(attributes = {})
      user = model_class.new(attributes)
      save(user)
    end
  end
end
