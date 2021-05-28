FactoryBot.define do
  factory :user do
    name { Faker::Games::Heroes.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end
