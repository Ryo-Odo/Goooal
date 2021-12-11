class UsersController < ApplicationController
  def index
    if params[:follow_search].present?
      @search = User.ransack(params[:q])
      @search.sorts = 'created_at desc'
      @users = User.find(params[:follow_search][:user_id]).following
    elsif params[:follower_search].present?
      @search = User.ransack(params[:q])
      @search.sorts = 'created_at desc'
      @users = User.find(params[:follower_search][:user_id]).followers
    else
      @search = User.ransack(params[:q])
      @search.sorts = 'created_at desc'
      @users = @search.result(distinct: true)
    end

  end

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets.order(created_at: "desc")
    @follow_count = Relationship.where(follower_id: @user.id).count
    @follower_count = Relationship.where(followed_id: @user.id).count
  end

end
