# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.initials }
    email { Faker::Internet.free_email }
    introduce { Faker::Lorem.sentence }
    admin { 0 }
    password { '12345a!^' }
    password_confirmation { password }

    after(:build) do |user|
      user.image.attach(io: File.open("#{Rails.root}/spec/fixtures/files/test_image.png"), filename: 'test_image.png')
    end
  end
end
