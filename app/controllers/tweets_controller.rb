class TweetsController < ApplicationController
  def create
    if params[:tweet][:goal_id] == "no_goal"
      redirect_to root_path, notice: "まずはサイドバーから「ゴールを投稿」しよう！"
    elsif params[:tweet][:content].blank?
      redirect_to root_path, notice: "つぶやきを入力してください"
    else
      @tweet = Tweet.new(params.require(:tweet).permit(:goal_id, :content))
      if @tweet.save
        redirect_to root_path, notice: "つぶやきました！"
      else
        redirect_to root_path, notice: "つぶやきに失敗しました"
      end
    end
  end
end
