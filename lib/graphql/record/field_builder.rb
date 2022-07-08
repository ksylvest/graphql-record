# frozen_string_literal: true

module GraphQL
  module Record
    class FieldBuilder < BaseBuilder
      def build
        case
        when association
          ActiveRecord::AssociationBuilder.build(@record, @model, @attribute, association)
        when attachment
          ActiveStorage::AttachmentBuilder.build(@record, @model, @attribute, attachment)
        when column
          ActiveRecord::ColumnBuilder.build(@record, @model, @attribute, column)
        end
      end

    private

      def association
        @association ||= @model.reflect_on_association(@attribute)
      end

      def attachment
        @attachment ||= @model.reflect_on_attachment(@attribute)
      end

      def column
        @column ||= @model.column_for_attribute(@attribute)
      end
    end
  end
end
