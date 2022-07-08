# frozen_string_literal: true

module GraphQL
  module Record
    module ActiveRecord
      class ColumnBuilder < BaseBuilder
        TYPES = {
          boolean: GraphQL::Types::Boolean,
          string: GraphQL::Types::String,
          integer: GraphQL::Types::Int,
          float: GraphQL::Types::Float,
          datetime: GraphQL::Types::ISO8601DateTime,
          date: GraphQL::Types::ISO8601Date,
        }
        private_constant :TYPES

        # @param record [Class<Schema::Object>]
        # @param model [Class<ActiveRecord::Base>]
        # @param attribute [Symbol]
        # @param column [ActiveRecord::ConnectionAdapters::Column]
        def initialize(record, model, attribute, column)
          super(record, model, attribute)
          @column = column
        end

        def build
          @record.field(@attribute, type, null: @column.null)
        end

      private

        # @return [GraphQL::Schema::Scalar]
        def type
          return ::GraphQL::Types::ID if @column.name.eql?('id')
          return ::GraphQL::Types::BigInt if @column.bigint?

          TYPES[@column.type] || raise(BuildError, "Unknown column or association '#{@attribute}' for '#{@model}'.")
        end
      end
    end
  end
end
