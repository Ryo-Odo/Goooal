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
      @goal_titles = [["まだゴールを投稿していません、サイドバーからゴールを投稿しよう！", "no_goal"]]
    else
      @goal_titles = Goal.where(user_id: current_user.id).pluck(:goal_title, :id)
    end
  end
end
