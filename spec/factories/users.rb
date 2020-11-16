FactoryBot.define do
  factory :user do
    name {Faker::Name.initials}
    email {Faker::Internet.free_email}
    introduce {Faker::Lorem.sentence}
    admin {0}
    password {Faker::Internet.password}
    password_confirmation {password}

    after(:build) do |user|
      user.image.attach(io: File.open('public/テスト画像.png')), filename: 'テスト画像'
    end
  end
end
