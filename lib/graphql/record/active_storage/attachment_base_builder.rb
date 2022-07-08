# frozen_string_literal: true

module GraphQL
  module Record
    module ActiveStorage
      class AttachmentBaseBuilder < BaseBuilder
        # @param record [Class<Schema::Object>]
        # @param model [Class<ActiveRecord::Base>]
        # @param attribute [Symbol]
        # @param reflection [ActiveStorage::Reflection::HasAttachedReflection]
        def initialize(record, model, attribute, reflection)
          super(record, model, attribute)
          @reflection = reflection
        end
      end
    end
  end
end
