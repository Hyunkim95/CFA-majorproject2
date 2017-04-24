class PagesController < ApplicationController
  def developer_index
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
    
    @solved_challenges = Challenge.where(solved: true)
  end

  def business_owner_index
    @unsolved_challenges = Challenge.where(solved: false).where(user_id: current_user.id)
  end
end
