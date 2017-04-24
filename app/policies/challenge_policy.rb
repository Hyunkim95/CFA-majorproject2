class ChallengePolicy
  attr_reader :user, :challenge

  def initialize(user, challenge)
    @user = user
    @challenge = challenge
  end

  def index?
    false
  end

  def create?
    false
  end

  def new?
    user.has_role? :business_owner
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end
end
