FactoryBot.define do
  factory :room do
    room_name { Faker::Team.name }
    room_password { Faker::Number.number(digits: 4) }
  end
end
