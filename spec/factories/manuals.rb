FactoryBot.define do
  factory :manual do
    association :user
    association :room
    manual_name { Faker::Name.name }
    model_number { '213abc' }
    manual_url { Faker::Internet.url }
    assurance { Faker::Date.birthday }
    manual_date { Faker::Date.birthday }
    price { Faker::Number.number(digits: 4) }
    manual_memo { 'メモ欄です' }
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
