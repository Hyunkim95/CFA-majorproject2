class PagesController < ApplicationController
  def developer_index
    @unsolved_challenges = Challenge.where(solved: false)
    @challenge = Challenge.new
  end

  def business_owner_index
    @unsolved_challenges = Challenge.where(solved: false).where(user_id: current_user.id)
  end
end
