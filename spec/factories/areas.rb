# frozen_string_literal: true

FactoryBot.define do
  factory :area do
    name { Faker::Name.initials }
    island { Island.all.sample }
  end
end
