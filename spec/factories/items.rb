FactoryBot.define do
  factory :item do
    association :user
    association :room
    item_name { Faker::Name.name }
    item_memo { Faker::Lorem.characters(number: 30) }
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
