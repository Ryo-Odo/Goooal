class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.new(params.require(:comment).permit(:tweet_id, :content))
    if @comment.save
      redirect_to tweet_path(params[:comment][:tweet_id]), notice: "コメントを投稿しました"
    else
      @tweet = Tweet.find(params[:comment][:tweet_id])
      @comments = @tweet.comments.order(created_at: "desc")
      flash.now[:alert] = "コメントの投稿に失敗しました"
      gon.tweet_id = Tweet.find(params[:comment][:tweet_id]).id
      render "tweets/show"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if current_user == @comment.user
      @comment.destroy
      redirect_to tweet_path(@comment.tweet.id), notice: "コメントを削除しました"
    else
      redirect_to tweet_path(@comment.tweet.id), notice: "他のユーザーのコメントは削除できません"
    end
  end

end
