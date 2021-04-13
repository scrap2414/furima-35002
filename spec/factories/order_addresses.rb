FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_id { 1 }
    municipality { '横浜市' }
    house_number { '1-1' }
    building { '春風ハイツ' }
    phone_number { '09088227733' }
  end
end
