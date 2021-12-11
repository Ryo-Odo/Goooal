class HomesController < ApplicationController
  def index

    if params[:tweets].present?
      @tweets = []
      current_user.following.each do |user|
        user.tweets.each do |tweet|
          @tweets << tweet
        end
      end
      @tweets.sort_by! { |tweet| tweet[:created_at] }
      @tweets = @tweets.reverse
    else
      @tweets = Tweet.order(created_at: "desc")
    end

    @tweet = Tweet.new
    @users = User.all.order(created_at: "desc")
    @goals = Goal.all.order(created_at: "desc")

    if current_user.goals.count == 0
      @goal_titles = [["まだ目標がありません！　サイドバーの「目標を投稿」から目標を投稿しよう！", "no_goal"]]
    else
      @goal_titles = Goal.where(user_id: current_user.id).pluck(:goal_title, :id)
    end
  end

  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.user_account_name = "general_user"
    end
    if User.where(user_account_name: user.user_account_name).present?
      if Profile.where(user_id: user.id).blank?
        user_id = User.where(user_account_name: user.user_account_name).ids[0]
        Profile.create(user_id: user_id, user_name: "一般ゲストユーザー", introduction: "自己紹介してみよう！")
      end
    end
    sign_in user
    redirect_to root_path, notice: '一般ゲストユーザーとしてログインしました。'
  end

  def admin_guest_sign_in
    user = User.find_or_create_by!(email: 'admin_guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.user_account_name = "admin_user"
      user.admin = true
    end
    if User.where(user_account_name: user.user_account_name).present?
      if Profile.where(user_id: user.id).blank?
        user_id = User.where(user_account_name: user.user_account_name).ids[0]
        Profile.create(user_id: user_id, user_name: "管理ゲストユーザー", introduction: "自己紹介してみよう！")
      end
    end
    sign_in user
    redirect_to root_path, notice: '管理ゲストユーザーとしてログインしました。'
  end
end
