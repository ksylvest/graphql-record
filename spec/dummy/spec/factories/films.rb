# frozen_string_literal: true

FactoryBot.define do
  factory :film do
    studio
    genre { 'comedy' }
    name { 'Toy Story' }
    release { Date.new(1995, 11, 22) }
    duration { 2.hours }
  end
end
