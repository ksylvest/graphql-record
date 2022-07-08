# frozen_string_literal: true

FactoryBot.define do
  factory :actor do
    name { 'Tom Hanks' }

    trait :with_photo do
      after :build do |actor|
        io = File.open(File.join(__dir__, 'files/photo.png'))
        actor.photo.attach(io: io, filename: 'photo.png', content_type: 'image/png')
      end
    end
  end
end
