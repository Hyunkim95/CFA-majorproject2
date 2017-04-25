class ProfilesController < ApplicationController
  def show
    @project = Project.new
    @user = User.find(params[:id])
    @projects = Project.where(user_id: @user.id).order(created_at: :desc)
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      redirect_to :back
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:experience)
  end
end
