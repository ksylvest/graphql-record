# frozen_string_literal: true

class Studio < ApplicationRecord
  has_many :films
  has_one_attached :logo

  validates :name, presence: true
end
