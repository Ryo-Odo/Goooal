FactoryBot.define do
  factory :comment do
    id {1}
    content { "コメント１の内容" }
    user_id {1}
    tweet_id {1}
  end
end
