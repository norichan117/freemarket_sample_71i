FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    family_name           {"阿部"}
    first_name            {"太郎助"}
    family_name_kana      {"アベ"}
    first_name_kana       {"タロウスケ"}
    birthday              {"1992-09-22"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
  end

end

