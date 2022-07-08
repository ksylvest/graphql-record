# frozen_string_literal: true

RSpec.describe GraphQL::Record do
  it 'has a version number' do
    expect(GraphQL::Record::VERSION).not_to be_nil
  end
end
