# frozen_string_literal: true

FactoryBot.define do
  factory :experience do
    name { Faker::Name.initials }
    outline { Faker::Lorem.sentence }
    address { Faker::Address.city }
    latitude { Faker::Address.latitude.round(6) }
    longitude { Faker::Address.longitude.round(6) }
    business_hours_start { "#{rand(0..12)}:#{rand(0..59)}" }
    business_hours_finish { "#{rand(13..24)}:#{rand(0..59)}" }
    score { rand(1..5) }
    heading { 0.123456 }
    pitch { 0.123456 }
    fov { 0.123456 }
    zoom { 0.123456 }

    after(:build) do |exp|
      exp.image.attach(io: File.open("#{Rails.root}/spec/fixtures/files/test_image.png"), filename: 'test_image.png')
    end

    association :area
    association :genre
  end
end
