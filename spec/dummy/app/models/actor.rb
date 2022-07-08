# frozen_string_literal: true

class Actor < ApplicationRecord
  has_many :castings
  has_many :films, through: :castings
  has_many_attached :photos
  validates :name, presence: true
end
