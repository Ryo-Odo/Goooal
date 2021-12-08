class ProfilesController < ApplicationController
  def edit
    puts params
    unless current_user.profile.id == params[:id].to_i
      redirect_to user_path(params[:user_id]), notice:"自分以外のプロフィールは編集できません"
    end
    @profile = Profile.find(params[:id])
  end

  def update
    binding.irb
    @profile = Profile.find(params[:id])
    if @profile.update(profiles_params)
      redirect_to user_path(Profile.find(params[:id]).user.id), notice: "プロフィールを編集しました"
    else
      render :edit
    end
  end

  private
  def profiles_params
    params.require(:profile).permit(:user_name, :introduction)
  end
end
