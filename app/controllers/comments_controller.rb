class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.new(params.require(:comment).permit(:tweet_id, :content))
    if @comment.save
      redirect_to tweet_path(params[:comment][:tweet_id]), notice: "コメントを投稿しました"
    else
      redirect_to tweet_path(params[:comment][:tweet_id]), notice: "コメントの投稿に失敗しました"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    binding.irb
    if current_user == @comment.user
      @comment.destroy
      redirect_to tweet_path(@comment.tweet.id), notice: "コメントを削除しました"
    else
      redirect_to tweet_path(@comment.tweet.id), notice: "他のユーザーのコメントは削除できません"
    end
  end

end
