class ProfilesController < ApplicationController
  def show
    @project = Project.new
    @projects = Project.where(user_id: current_user.id).order(created_at: :desc)
    @solutions = Solution.where(user_id: current_user.id).order(created_at: :desc)

    @total_projects = @projects + @solutions
  end
end
