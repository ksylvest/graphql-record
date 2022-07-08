# frozen_string_literal: true

class Casting < ApplicationRecord
  belongs_to :actor
  belongs_to :film

  validates :priority, presence: true, uniqueness: { scope: :film_id }

  scope :ordered, -> { order(:priority) }
end
