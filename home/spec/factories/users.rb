FactoryBot.define do
  factory :user do
    username 'Roman'
    password 'ssdfsd'
    email 'tol@mail.ru'
  end
  factory :random_user, class: User do
    username Faker::Name.name
    password Faker::Internet.password
    email Faker::Internet.email
  end
end
