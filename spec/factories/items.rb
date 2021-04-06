FactoryBot.define do
  factory :item do
    name  { 'テスト' }
    information { 'テスト' }
    category_id { '2' }
    status_id { '2' }
    prefecture_id{ '2' }
    deliveryprice_id { '2' }
    deliveryday_id{ '2' }
    itemprice{ '800' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/2af7e5e0.jpg'), filename: '2af7e5e0.jpg')
    end
  end
end
