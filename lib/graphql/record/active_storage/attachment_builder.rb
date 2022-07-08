# frozen_string_literal: true

module GraphQL
  module Record
    module ActiveStorage
      class AttachmentBuilder < AttachmentBaseBuilder
        def build
          builder.build(@record, @model, @attribute, @reflection)
        end

      private

        def builder
          case @reflection
          when ::ActiveStorage::Reflection::HasManyAttachedReflection
            Attachment::HasManyAttachedBuilder
          when ::ActiveStorage::Reflection::HasOneAttachedReflection
            Attachment::HasOneAttachedBuilder
          else
            raise(BuildError, "Unsupported attachment '#{@attribute}' for '#{@model}'.")
          end
        end
      end
    end
  end
end
