# frozen_string_literal: true

module GraphQL
  module Record
    class BaseBuilder
      class BuildError < StandardError; end

      def self.build(...)
        new(...).build
      end

      # @param record [Class<Schema::Object>]
      # @param model [Class<ActiveRecord::Base>]
      # @param attribute [Symbol]
      def initialize(record, model, attribute)
        @record = record
        @model = model
        @attribute = attribute
      end

      def build
        @record.field(@attribute, type, null: null)
      end

    protected

      def type
        raise NotImplementedError, 'A subclass must implement #type'
      end

      # @return [Boolean]
      def null
        raise NotImplementedError, 'A subclass must implement #null'
      end
    end
  end
end
