FactoryBot.define do
  factory :user do
    id {1}
    user_account_name { "user_1" }
    email { "user_1@email.com" }
    password { '111111' }
    admin {false}
  end

  factory :second_user , class: User do
    id {2}
    user_account_name { "user_2" }
    email { "user_2@email.com" }
    password { '222222' }
    admin {true}
  end
end
