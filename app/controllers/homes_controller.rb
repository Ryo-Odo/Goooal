class HomesController < ApplicationController
  def index
    @tweets = Tweet.order(created_at: "desc")
    @tweet = Tweet.new
    @users = User.all
    @goals = Goal.all

    if current_user.goals.count == 0
      @goal_titles = [["まだゴールを投稿していません、サイドバーからゴールを投稿しよう！", "no_goal"]]
    else
      @goal_titles = Goal.where(user_id: current_user.id).pluck(:goal_title, :id)
    end
  end
end
