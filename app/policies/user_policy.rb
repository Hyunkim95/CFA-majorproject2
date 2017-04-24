class UserPolicy
  attr_reader :user

  def initialize(user, scope)
    @user = user
    @scope = scope
  end

  def developer_index?
    user.has_role? :developer
  end

  def business_owner_index?
    user.has_role? :business_owner
  end
end
