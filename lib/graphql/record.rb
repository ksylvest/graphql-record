# frozen_string_literal: true

require 'graphql'

require_relative './record/define'
require_relative './record/base_builder'
require_relative './record/field_builder'
require_relative './record/active_record/association_base_builder'
require_relative './record/active_record/association_builder'
require_relative './record/active_record/association/belongs_to_builder'
require_relative './record/active_record/association/has_many_builder'
require_relative './record/active_record/association/has_one_builder'
require_relative './record/active_record/association/through_builder'
require_relative './record/active_record/column_builder'
require_relative './record/active_storage/attachment_base_builder'
require_relative './record/active_storage/attachment_builder'
require_relative './record/active_storage/attachment/has_many_attached_builder'
require_relative './record/active_storage/attachment/has_one_attached_builder'
require_relative './record/types/active_storage_attached_type'

module GraphQL
  module Record
    def self.define(...)
      Record::Define.build(...)
    end
  end
end
