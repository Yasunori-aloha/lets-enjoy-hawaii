FactoryBot.define do
  factory :history do
    association :user
    association :experience
  end
end
