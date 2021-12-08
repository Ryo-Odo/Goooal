class ProfilesController < ApplicationController
  def edit
    puts params
    unless current_user.profile.id == params[:id].to_i
      redirect_to user_path(params[:user_id]), notice:"自分以外のプロフィールは編集できません"
    end
    @profile = Profile.find(params[:id])
  end

  def update
    if @profile.update(profiles_params)
      redirect_to user_path(params[:id]), notice: "プロフィールを編集しました"
    else
      render :edit
    end
  end

  private
  def profiles_params
    params.require(:profile).permit(:user_name, :Introduction)
  end
end
