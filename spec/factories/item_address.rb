FactoryBot.define do
  factory :item_address do
    postal_code { '123-4567' }
    area_id { 2 }
    municipality { '西東京市' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
