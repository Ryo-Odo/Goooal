5.times do |n|
  User.create!(
    user_account_name: "user_#{n + 1}",
    email: "#{n + 1}@test.com",
    password: "111111"
  )
end

user_id = User.all.map do |user|
  user.id
end

user_id.each.with_index(1) do |id, index|
  Profile.create!(
    user_id: id,
    user_name: "新しいユーザー",
    introduction: "自己紹介してみよう！"
  )
end

user_id.each.with_index(1) do |id, index|
  Goal.create!(
    user_id: id,
    goal_title: "ユーザー" + index.to_s + "の目標",
    description: "目標の内容"
  )
end

goal_id = Goal.all.map do |goal|
  goal.id
end


goal_id.each.with_index(1) do |id, index|
  Tweet.create!(
    goal_id: id,
    content: "ユーザー" + index.to_s + "のつぶやき"
  )
end

tweet_id = Tweet.all.map do |tweet|
  tweet.id
end

tweet_id.each.with_index(1) do |id, index|
  Comment.create!(
    user_id: user_id[index - 1],
    tweet_id: id,
    content: "ユーザー" + index.to_s + "のコメント"
  )
end

5.times do |n|
  GoalTag.create!(
    goal_tag_name: "目標タグ#{n + 1}"
  )
end

goal_tag_id = GoalTag.all.map do |goal_tag|
  goal_tag.id
end

goal_tag_id.each.with_index(1) do |id, index|
  GoalTagging.create!(
    goal_id: goal_id[index - 1],
    goal_tag_id: id
  )
end

5.times do |n|
  TweetTag.create!(
    tweet_tag_name: "つぶやきタグ#{n + 1}"
  )
end

tweet_tag_id = TweetTag.all.map do |tweet_tag|
  tweet_tag.id
end

tweet_tag_id.each.with_index(1) do |id, index|
  TweetTagging.create!(
    tweet_id: tweet_id[index - 1],
    tweet_tag_id: id
  )
end

4.times do |n|
  Relationship.create!(
    follower_id: user_id[0],
    followed_id: user_id[n + 1]
  )
end

Relationship.create!(
  follower_id: user_id[1],
  followed_id: user_id[0]
)
