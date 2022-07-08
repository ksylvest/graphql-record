# frozen_string_literal: true

require 'graphql'

module GraphQL
  module Record
    class Define
      def self.build(...)
        new(...).build
      end

      def initialize(model, *attributes, &block)
        @model = model
        @attributes = attributes
        @block = block
      end

      def build
        Class.new(Schema::Object).tap do |type|
          @attributes.each do |attribute|
            FieldBuilder.build(type, @model, attribute)
          end
        end
      end
    end
  end
end
