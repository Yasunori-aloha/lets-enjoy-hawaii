FactoryBot.define do
  factory :experience do
    name {Faker::Name.initials}
    outline {Faker::Lorem.sentence}
    address {Faker::Address.city}
    latitude {Faker::Address.latitude.round(6)}
    longitude {Faker::Address.longitude.round(6)}
    business_hours_start {"#{rand(0..12)}:#{rand(0..59)}"}
    business_hours_finish {"#{rand(13..24)}:#{rand(0..59)}"}
    score {rand(1..5)}

    association :area
    association :genre

    after(:build) do |experience|
      experience.image.attach(io: File.open('public/テスト画像.png')), filename: 'テスト画像'
    end
  end
end
