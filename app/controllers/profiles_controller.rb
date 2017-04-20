class ProfilesController < ApplicationController
  def show
    @project = Project.new
    @projects = Project.where(user_id: current_user.id)
    @solutions = Solution.where(user_id: current_user.id)

    @total_projects = @projects + @solutions
  end
end
