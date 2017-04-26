class ChallengePolicy
  attr_reader :user, :challenge

  def initialize(user, challenge)
    @user = user
    @challenge = challenge
  end

  def index?
    user.has_role? :admin
  end

  def create?
    false
  end

  def new?
    user.has_role? :business_owner
  end

  def update?
    user.has_role? :admin
  end

  def edit?
    update?
  end

  def destroy?
    false
  end
end
