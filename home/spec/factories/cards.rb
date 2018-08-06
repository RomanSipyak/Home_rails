require 'faker'
FactoryBot.define do
  factory :card do
    title 'Title'
    description 'asfsafasfasfasfasfasfsafasfasfsafas'
    date Time.now
    list
  end

  factory :random_c, class: Card do
    title Faker::Name.name
    description Faker::WorldOfWarcraft.quote
    date Time.now
    list
  end
end
