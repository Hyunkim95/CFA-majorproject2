class SolutionPolicy
  attr_reader :user, :solution

  def initialize(user, solution)
    @user = user
    @solution = solution
  end

  def index?
    false
  end

  def create?
    user.has_role? :developer
  end

  def new?
    user.has_role? :developer
  end

  def update?
    user.has_role? :developer && current_user.id == @solution.user_id
  end

  def edit?
    user.has_role? :developer && current_user.id == @solution.user_id
  end

  def destroy?
    user.has_role? :developer && current_user.id == @solution.user_id
  end
end
