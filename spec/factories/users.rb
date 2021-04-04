FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { 'XXXX5588' }
    password_confirmation { password }
    first_name            { '春' }
    last_name             { '風' }
    first_name_kana       { 'ハル' }
    last_name_kana        { 'カゼ' }
    birthday              { '2000-01-01' }
  end
end
