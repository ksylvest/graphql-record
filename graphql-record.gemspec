# frozen_string_literal: true

require_relative 'lib/graphql/record/version'

Gem::Specification.new do |spec|
  spec.name = 'graphql-record'
  spec.version = GraphQL::Record::VERSION
  spec.authors = ['Kevin Sylvestre']
  spec.email = ['kevin@ksylvest.com']

  spec.summary = 'A set of common GraphQL DataLoader resources.'
  spec.description = 'Common loaders for various database or cache operations.'
  spec.homepage = 'https://github.com/ksylvest/graphql-record'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.6.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/ksylvest/graphql-record'
  spec.metadata['changelog_uri'] = 'https://github.com/ksylvest/graphql-record/blob/main/CHANGELOG.md'

  spec.files = Dir.glob('{bin,lib}/**/*') + %w[README.md LICENSE Gemfile]

  spec.require_paths = ['lib']

  spec.add_dependency 'graphql'
  spec.add_dependency 'rails'
  spec.add_development_dependency 'factory_bot'
  spec.add_development_dependency 'pg'
  spec.add_development_dependency 'rspec_junit_formatter'
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-rails'
  spec.add_development_dependency 'rubocop-rake'
  spec.add_development_dependency 'rubocop-rspec'
  spec.add_development_dependency 'shoulda-matchers'
  spec.add_development_dependency 'simplecov'
end
