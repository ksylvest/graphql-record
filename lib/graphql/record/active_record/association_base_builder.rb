# frozen_string_literal: true

module GraphQL
  module Record
    module ActiveRecord
      class AssociationBaseBuilder < BaseBuilder
        # @param record [Class<Schema::Object>]
        # @param model [Class<ActiveRecord::Base>]
        # @param attribute [Symbol]
        # @param reflection [ActiveRecord::Reflection::AssociationReflection]
        def initialize(record, model, attribute, reflection)
          super(record, model, attribute)
          @reflection = reflection
        end

        def type
          name = "#{@reflection.class_name}Type"
          -> { const_get(name) }
        end
      end
    end
  end
end
