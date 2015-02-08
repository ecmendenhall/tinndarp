require 'memory_repository/models/product'
require 'memory_repository/base'

module MemoryRepository
  class ProductRepository
    include Base

    def model_class
      MemoryRepository::Models::Product
    end

    def create(attributes = {})
      product = model_class.new(attributes)
      save(product)
    end
  end
end
