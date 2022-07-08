module GraphQL
  module Record
    module Types
      class ActiveStorageAttachedType < Schema::Object
        field :id, String, null: false
        field :filename, String, null: false
      end
    end
  end
end
