require 'memory_repository/models/base'

module MemoryRepository
  module Models
    class Product < Base
      data_attributes :article_number, :description, :name

      def catalog_url
        @catalog_url ||= catalog_path
      end

      private

      def catalog_path
        "http://www.ikea.com/us/en/catalog/products/#{article_number}/"
      end
    end
  end
end
