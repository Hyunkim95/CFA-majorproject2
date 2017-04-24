class ProfilesController < ApplicationController
  def show
    @project = Project.new
    @projects = Project.where(user_id: current_user.id).order(created_at: :desc)
  end
end
