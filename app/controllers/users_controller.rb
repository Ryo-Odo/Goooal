class UsersController < ApplicationController
  def index
    @search = User.ransack(params[:q])
    @search.sorts = 'created_at desc'
    @users = @search.result(distinct: true)

  end

  def show
    @user = User.find(params[:id])
  end

end
