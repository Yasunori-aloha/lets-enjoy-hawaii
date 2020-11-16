FactoryBot.define do
  factory :review do
    title {Faker::Lorem.word}
    comment {Faker::Lorem.sentence}
    score {rand(1..4)}
    association :user
    association :experience

  end
end
