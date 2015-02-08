require 'memory_repository/models/base'

module MemoryRepository
  module Models
    class Nope < Base
      data_attributes :user_id, :product_id
    end
  end
end
