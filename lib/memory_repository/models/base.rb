module MemoryRepository
  module Models
    class Base

      def initialize(attributes = {})
        attributes.each {|key, val| set(key, val) }
      end

      def id
        get(:id)
      end

      def id=(id)
        set(:id, id)
      end

      def set(key, val)
        instance_variable_set("@#{key}", val)
      end

      def get(key)
        instance_variable_get("@#{key}")
      end

      def attributes
        self.class._fields.inject({}) do |attributes, key|
          attributes[key] = get(key)
          attributes
        end
      end

      def self._fields
        @_fields ||= [:id]
      end

      def self.data_attributes(*fields)
        @_fields = self._fields | fields
        fields.each {|field| attr_accessor field }
      end
    end
  end
end
