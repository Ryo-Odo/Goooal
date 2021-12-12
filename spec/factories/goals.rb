FactoryBot.define do
  factory :goal do
    id {1}
    goal_title {"目標１"}
    description { "目標１の内容" }
    user_id {1}
  end
end
