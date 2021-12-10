class GoalsController < ApplicationController
  before_action :authenticate_user!#, only: [:new, :create]
  before_action :set_property, only: [:show, :destroy]


  def index
    @search = Goal.ransack(params[:q])
    @search.sorts = 'created_at desc'
    @goals = @search.result(distinct: true)

  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = current_user.goals.new(goals_params)
    goal_tag_list = params[:goal][:goal_tag_name].gsub(/　/," ").strip.split(nil)

    if goal_tag_list.count > 5
      flash.now[:alert] = "タグの数は５個までです"
      render :action => :new
    else
      if @goal.save
        goal_tag_list.each do |goal_tag_name|
          if GoalTag.exists?(goal_tag_name: goal_tag_name)
            goal_tag_id = GoalTag.where(goal_tag_name: goal_tag_name).ids[0]
            @goal.goal_taggings.create(goal_tag_id: goal_tag_id) #もしすでに同じタグがあったら、そのIDから中間テーブルだけ作る
          else
            @goal.goal_tags.create(goal_tag_name: goal_tag_name) #まだなかったらタグと中間テーブルのレコードを作る
          end
        end
        redirect_to root_path, notice: "目標を投稿しました！"
      else
        render :new, notice: "目標を投稿に失敗しました"
      end
    end
  end

  def show
    @tweets = @goal.tweets.order(created_at: "desc")
  end

  def destroy
    if current_user == @goal.user
      @goal.destroy
      redirect_to user_path(@goal.user.id), notice: "ゴールを削除しました"
    else
      redirect_to user_path(@goal.user.id), notice: "他のユーザーのゴールは削除できません"
    end
  end

  private

  def set_property
    @goal = Goal.find(params[:id])
  end

  def goals_params
    params.require(:goal).permit(:goal_title, :description)
  end



end
