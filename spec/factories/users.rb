require 'gimei'

FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { 'a5' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    lastname              { Gimei.name.last.kanji }
    firstname             { Gimei.name.first.kanji }
    lastname_kana         { Gimei.name.last.katakana }
    firstname_kana        { Gimei.name.first.katakana }
    birth                 { Faker::Date.birthday(min_age: 18, max_age: 100) }
  end
end
