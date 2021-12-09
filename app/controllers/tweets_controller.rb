class TweetsController < ApplicationController
  def create
    if params[:tweet][:goal_id] == "no_goal"
      redirect_to root_path, notice: "まずはサイドバーから「ゴールを投稿」しよう！"
    elsif params[:tweet][:content].blank?
      redirect_to root_path, notice: "つぶやきを入力してください"
    else
      @tweet = Tweet.new(params.require(:tweet).permit(:goal_id, :content))
      tweet_tag_list = params[:tweet][:tweet_tag_name].gsub(/　/," ").strip.split(nil)

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
        redirect_to root_path, notice: "つぶやきに失敗しました"
      end
    end
  end
end
