5.times do |n|
  User.create!(
    user_account_name: "user_#{n + 1}",
    email: "#{n + 1}@test.com",
    password: "111111"
  )
end

binding.irb
user_id = User.all.map do |user|
  user.id
end
