# frozen_string_literal: true

FactoryBot.define do
  factory :sns_credential do
    facebook_omniauth = Faker::Omniauth.facebook
    provider { facebook_omniauth[:provider] }
    uid { facebook_omniauth[:uid] }

    association :user
  end
end
