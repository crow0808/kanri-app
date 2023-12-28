FactoryBot.define do
  factory :book do
    association :user
    association :room
    book_name { Faker::Name.name }
    book_number { Faker::Number.number(digits: 2) }
    book_memo { Faker::Lorem.characters(number: 30) }
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
