class GoalsController < ApplicationController
  before_action :set_property, only: [:show, :destroy]

  def index
    @goals = Goal.all
  end

  def new
    @goal = Goal.new
  end

  def create

    if Goal.create(goals_params)
      redirect_to goals_path, notice: "登録しました！"
    else
      render :new, notice: "登録に失敗しました"
    end
  end

  def show
  end

  def destroy
    @goal.destroy
    redirect_to goals_path, notice:"削除しました"
  end





  private
  def set_property
    @goal = Goal.find(params[:id])
  end

  def goals_params
    params.require(:goal).permit(:goal_title, :description)
  end

end
