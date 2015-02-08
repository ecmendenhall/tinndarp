require 'memory_repository/models/base'

module MemoryRepository
  module Models
    class User < Base
      data_attributes :email
    end
  end
end
