FactoryBot.define do
  factory :item do
    name              { 'test' }
    text              { 'test' }
    category_id       { 2 }
    condition_id      { 2 }
    load_id           { 2 }
    region_id         { 2 }
    delivery_date_id  { 2 }
    price             { 300 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
