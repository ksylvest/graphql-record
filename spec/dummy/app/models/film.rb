# frozen_string_literal: true

class Film < ApplicationRecord
  belongs_to :studio
  has_many :castings, -> { ordered }
  has_many :actors, through: :castings

  enum genre: {
    action: 'action',
    comedy: 'comedy',
    drama: 'drama',
    fantasy: 'fantasy',
    horror: 'horror',
    mystery: 'mystery',
    romance: 'romance',
    thriller: 'thriller',
  }

  validates :name, presence: true
  validates :release, presence: true
end
