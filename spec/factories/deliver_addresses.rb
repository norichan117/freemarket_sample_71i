FactoryBot.define do


  factory :deliver_address do
    user_id                         {"1"}
    deliver_family_name             {"小林"}
    deliver_first_name              {"花子"}
    deliver_family_name_kana        {"コバヤシ"}
    deliver_first_name_kana         {"ハナコ"}
    deliver_yubin_bango             {"119−0000"}
    deliver_todofuken               {"東京都"}
    deliver_shichoson               {"豊島区千早"}
    deliver_banchi                  {"3−1−1"}
    deliver_building                {"高級ビル303号"}
    deliver_tel_no                  {"090−0000−0000"}
  end

end

