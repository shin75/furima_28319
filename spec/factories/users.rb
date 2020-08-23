FactoryBot.define do
  factory :user do
    first_name            {"田中"}
    first_name_kana       {"アアア"}
    last_name             {"太郎"}
    last_name_kana        {"イイイ"}
    name                  {"abe"}
    birth_day             {"2000-01-01"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {password}
  end
end