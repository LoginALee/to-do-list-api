FactoryBot.define do
  factory :user do
    username { Faker::Name.name }
    password { Faker::Internet.password }
    email { Faker::Internet.email }
  end

  factory :to_do do
    title { Faker::Lorem.sentence }
    done { Faker::Boolean.boolean }
  end
end
