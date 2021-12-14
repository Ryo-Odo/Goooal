class TweetsController < ApplicationController

  def index
    @search = Tweet.ransack(params[:q])
    @search.sorts = 'created_at desc'
    @tweets = @search.result(distinct: true)
  end

  def create
    if params[:tweet][:goal_id] == "no_goal"
      redirect_to root_path, notice: "まずはサイドバーから「目標を投稿」しよう！"
    elsif params[:tweet][:content].blank?
      redirect_to root_path, notice: "つぶやきを入力してください"
    else
      @tweet = Tweet.new(params.require(:tweet).permit(:goal_id, :content))
      tweet_tag_list = params[:tweet][:tweet_tag_name].gsub(/　/," ").strip.split(nil)
      if tweet_tag_list.count > 5
        render_home
        flash.now[:alert] = "タグの数は５個までです"
        render "homes/index"
      else
        if @tweet.save
          tweet_tag_list.each do |tweet_tag_name|
            if TweetTag.exists?(tweet_tag_name: tweet_tag_name)
              tweet_tag_id = TweetTag.where(tweet_tag_name: tweet_tag_name).ids[0]
              @tweet.tweet_taggings.create(tweet_tag_id: tweet_tag_id) #もしすでに同じタグがあったら、そのIDから中間テーブルだけ作る
            else
              @tweet.tweet_tags.create(tweet_tag_name: tweet_tag_name) #まだなかったらタグと中間テーブルのレコードを作る
            end
          end
          redirect_to root_path, notice: "つぶやきました！"
        else
          render_home
          flash.now[:alert] = "つぶやきに失敗しました"
          render "homes/index"
        end
      end
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comment = Comment.new
    @comments = @tweet.comments.order(created_at: "desc")
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    if current_user == @tweet.goal.user
      @tweet.destroy
      redirect_to goal_path(@tweet.goal.id), notice: "つぶやきを削除しました"
    else
      redirect_to goal_path(@tweet.goal.id), notice: "他のユーザーのつぶやきは削除できません"
    end
  end

  private

  def render_home
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
    @users = User.all.order(created_at: "desc")
    @goals = Goal.all.order(created_at: "desc")
    if current_user.goals.count == 0
      @goal_titles = [["まだ目標がありません！　サイドバーの「目標を投稿」から目標を投稿しよう！", "no_goal"]]
    else
      @goal_titles = Goal.where(user_id: current_user.id).pluck(:goal_title, :id)
    end
  end

end
