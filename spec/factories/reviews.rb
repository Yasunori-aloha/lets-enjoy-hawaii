FactoryBot.define do
  factory :review do
    title {Faker::Lorem.word}
    comment {Faker::Lorem.sentence}
    score {rand(1..4)}
    association :user
    association :experience

    after(:build) do |review|
      reivew.image.attach(io: File.open('public/テスト画像.png')), filename: 'テスト画像'
  end
end
