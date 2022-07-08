# frozen_string_literal: true

module GraphQL
  module Record
    module ActiveStorage
      module Attachment
        class HasOneAttachedBuilder < AttachmentBaseBuilder
          def type
            Types::ActiveStorageAttachedType
          end

          def null
            true
          end
        end
      end
    end
  end
end
