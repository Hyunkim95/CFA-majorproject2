class PagesController < ApplicationController
  def developer_index
    authorize current_user
    @unsolved_challenges = Challenge.where(solved: false)
    @challenge = Challenge.new
    @challenge_in_progress = current_user.challenges_with_solutions.uniq.select{|challenge| challenge.solved == false}
    @auto_pick = []

    @challenge_in_progress.each do |challenge|
      challenge.solutions.each do |solution|
        if solution.auto == true
          @auto_pick << challenge
        end
      end
    end

    if @unsolved_challenges.empty?
       @not_participated = []
    else
      @not_participated = (@unsolved_challenges - @challenge_in_progress).slice(0..2)
    end

    @user_participated = []

    Challenge.where(solved:true).reverse.each do |challenge|
      challenge.solutions.each do |solution|
        if solution.user_id == current_user.id
          @user_participated << challenge
        end
      end
    end

    @solved_by_user = []

    Challenge.where(solved: true).each do |challenge|
      if Solution.find(challenge.solution).user_id == current_user.id
        @solved_by_user << challenge
      end
    end
  end

  def business_owner_index
    authorize current_user
    @unsolved_challenges = Challenge.where(solved: false).where(user_id: current_user.id)
  end
end
