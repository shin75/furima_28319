FactoryBot.define do
  factory :user do
    first_name            {Gimei.last.kanji}
    first_name_kana       {Gimei.last.katakana}
    last_name             {Gimei.first.kanji}
    last_name_kana        {Gimei.first.katakana}
    name                  {Gimei.kanji}
    birth_day             {Faker::Date.birthday}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end