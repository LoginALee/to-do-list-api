FactoryBot.define do
  factory :user do
    username { Faker::Name.name }
    password { Faker::Internet.password }
    email { Faker::Internet.email }
  end
end
