FactoryBot.define do
  factory :genre do
    name { Faker::Name.initials }
    category { Category.all.sample }
  end
end
