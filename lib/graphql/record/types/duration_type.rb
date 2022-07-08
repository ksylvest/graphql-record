module GraphQL
  module Record
    module Types
      class DurationType < GraphQL::Schema::Scalar
        def self.coerce_input(input, _context)
          ActiveSupport::Duration.parse(input)
        rescue ActiveSupport::Duration::ISO8601Parser::ParsingError
          nil
        end

        def self.coerce_result(result, _context)
          result.iso8601
        end
      end
    end
  end
end
