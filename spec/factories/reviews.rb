# frozen_string_literal: true

FactoryBot.define do
  factory :review do
    title { Faker::Lorem.word }
    comment { Faker::Lorem.sentence }
    score { rand(1..5).to_f }

    after(:build) do |review|
      review.images.attach(io: File.open("#{Rails.root}/spec/fixtures/files/test_image.png"), filename: 'test_image.png')
    end

    association :user
    association :experience
  end
end
