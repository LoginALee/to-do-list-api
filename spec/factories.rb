# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { Faker::Name.name }
    password { Faker::Internet.password }
    email { Faker::Internet.email }
  end

  factory :todo do
    title { Faker::Name.name }
    done { true }
  end
end
