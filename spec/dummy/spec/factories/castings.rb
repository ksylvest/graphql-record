# frozen_string_literal: true

FactoryBot.define do
  factory :casting do
    sequence(:priority)
    actor
    film
  end
end
