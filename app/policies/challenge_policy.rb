class ChallengePolicy < ApplicationPolicy
  attr_reader :user, :challenge

  def initialize(user, challenge)
    @user  = user
    @challenge = challenge
  end

  def index?
    user.has_role? :business_owner
  end

  def show?
    user.has_role? :business_owner
  end

  def create?
    user.has_role? :business_owner
  end

  def new?
    user.has_role? :business_owner
  end

  def update?
    user.has_role? :business_owner
  end

  def edit?
    user.has_role? :business_owner
  end

  def destroy?
    user.has_role? :business_owner
  end

end
