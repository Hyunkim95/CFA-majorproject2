class ProfilesController < ApplicationController
  def show
    @solutions = Solution.where(user_id: current_user.id)
    @project = Project.new
    @projects = Project.where(user_id: current_user.id)
  end
end
