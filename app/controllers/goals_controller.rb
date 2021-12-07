class GoalsController < ApplicationController
  before_action :authenticate_user!#, only: [:new, :create]
  before_action :set_property, only: [:show, :destroy]


  def index

    @search = Goal.ransack(params[:q])
    @search.sorts = 'created_at desc'
    @goals = @search.result(distinct: true)
    @condition = ""

    if params[:q].present?
      @condition = params[:q]
    end




  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = current_user.goals.build(goals_params)
    if @goal.save
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
