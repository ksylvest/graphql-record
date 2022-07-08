# frozen_string_literal: true

module GraphQL
  module Record
    module ActiveStorage
      module Attachment
        class HasManyAttachedBuilder < AttachmentBaseBuilder
          def type
            [Types::ActiveStorageAttachedType]
          end

          def null
            false
          end
        end
      end
    end
  end
end
