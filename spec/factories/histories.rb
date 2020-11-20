# frozen_string_literal: true

FactoryBot.define do
  factory :history do
    association :user
    association :experience
  end
end
