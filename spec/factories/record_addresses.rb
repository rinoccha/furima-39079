FactoryBot.define do
  factory :record_address do
    post_code { '123-4567' }
    area_id { 2 }
    city { 'テスト市' }
    address { 'テスト123' }
    building { 'テスてすビル' }
    telephone_number { '09012345678' }
  end
end