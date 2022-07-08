# frozen_string_literal: true

FactoryBot.define do
  factory :studio do
    name { 'Pixar' }

    trait :with_logo do
      after :build do |user|
        io = File.open(File.join(__dir__, 'files/photo.png'))
        user.avatar.attach(io: io, filename: 'photo.png', content_type: 'image/png')
      end
    end
  end
end
