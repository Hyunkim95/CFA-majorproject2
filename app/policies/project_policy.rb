class ProjectPolicy
  attr_reader :user, :project

  def initialize(user, project)
    @user = user
    @project = project
  end

  def index?
    false
  end

  def create?
    user.has_role? (:developer) or user.has_role? :admin
  end

  def new?
    user.has_role? (:developer) or user.has_role? :admin
  end

  def update?
    (user.has_role? (:developer) && current_user.id == @project.user_id) or user.has_role? :admin
  end

  def edit?
    (user.has_role? (:developer) && current_user.id == @project.user_id) or user.has_role? :admin
  end

  def destroy?
    (user.has_role? (:developer) && current_user.id == @project.user_id) or user.has_role? :admin
  end
end
