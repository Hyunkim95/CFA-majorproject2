class ProfilesController < ApplicationController
  def show
    @project = Project.new
    @user = User.find(params[:id])
    @projects = Project.where(user_id: @user.id).order(created_at: :desc)
  end
end
