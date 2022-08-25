FactoryBot.define do
  factory :user do
    username { Faker::Name }
    password { Faker::Games::Pokemon }
    email { Faker::Internet.email }
  end
end
