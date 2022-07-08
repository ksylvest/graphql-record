# frozen_string_literal: true

module GraphQL
  module Record
    module ActiveRecord
      module Association
        class BelongsToBuilder < AssociationBaseBuilder
          # @return [Boolean]
          def null
            raise NotImplementedError, 'A subclass must implement #null'
          end
        end
      end
    end
  end
end
