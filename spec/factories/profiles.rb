FactoryBot.define do
  factory :profile do
    id {1}
    user_name { "ユーザー1" }
    introduction { "ユーザー2の自己紹介" }
    user_id {2}
  end

  factory :second_profile , class: User do
    id {2}
    user_name { "ユーザー2" }
    introduction { "ユーザー2の自己紹介" }
    user_id {2}
  end
end
