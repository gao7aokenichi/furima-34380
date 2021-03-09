FactoryBot.define do
  factory :item do
    association :user
    name { 'sample' }
    text { 'sample' }
    category_id { 2 }
    status_id { 2 }
    charge_id { 2 }
    area_id { 2 }
    day_id { 2 }
    price { 300 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
