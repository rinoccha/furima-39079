FactoryBot.define do
  factory :user do
    nick_name             { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { '真人' }
    first_name_kana       { 'マサト' }
    family_name           { '武田' }
    family_name_kana      { 'タケダ' }
    birth_day             { Faker::Date.backward }
  end
end
