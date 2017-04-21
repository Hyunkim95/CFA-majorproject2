class PagesController < ApplicationController
  def index
    @unsolved_challenges = Challenge.where(solved: false)
    @challenge = Challenge.new

  end
end
