FactoryBot.define do
  factory :user do
    username 'Roman'
    password 'ssdfsd'
    email Faker::Internet.unique.email
  end
  factory :random_user, class: User do
    username Faker::Name.name
    password Faker::Internet.password
    email { Faker::Internet.unique.email }
  end
end
