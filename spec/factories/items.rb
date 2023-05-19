FactoryBot.define do
  factory :item do
    image                   { Faker::Lorem.sentence }
    goods_name              { Faker::Game.title }
    goods_explanation       { Faker::Game.genre }
    category_id             { rand(2..11) }
    condition_id            { rand(2..7) }
    charge_id               { rand(2..3) }
    area_id                 { rand(2..48) }
    ship_id                 { rand(2..4) }
    price                   { rand(300..9999999) }

    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
