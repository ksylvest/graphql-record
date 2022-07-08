# frozen_string_literal: true

module GraphQL
  module Record
    module ActiveRecord
      class AssociationBuilder < AssociationBaseBuilder
        def build
          builder.build(@record, @model, @attribute, @reflection)
        end

      private

        def builder
          case @reflection
          when ::ActiveRecord::Reflection::BelongsToReflection
            Association::BelongsToBuilder
          when ::ActiveRecord::Reflection::HasManyReflection
            Assocation::BelongsToBuilder
          when ::ActiveRecord::Reflection::HasOneReflection
            Association::HasManyBuilder
          when ::ActiveRecord::Reflection::ThroughReflection
            Association::ThroughBuilder
          else
            raise(BuildError, "Unsupported association '#{@attribute}' for '#{@model}'.")
          end
        end
      end
    end
  end
end
