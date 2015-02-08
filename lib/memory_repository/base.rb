module MemoryRepository
  ObjectNotFound = Class.new(RuntimeError)

  module Base
    def save(object)
      object.id = objects.size + 1 if object.id.nil?
      objects[object.id] = object
    end

    def find(id)
      object = objects[id]
      raise ObjectNotFound unless object
      object
    end

    def delete(id)
      objects.delete(id)
    end

    def objects
      @objects ||= {}
    end

    def all
      objects.values
    end

    def destroy_all!
      @objects = {}
    end

  end
end
