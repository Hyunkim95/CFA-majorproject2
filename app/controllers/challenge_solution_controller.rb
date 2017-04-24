class ChallengeSolutionController < ApplicationController
  def update
    @challenge = Challenge.find(params[:id])
    @challenge.update(challenge_params)
    @solution = Solution.find(@challenge.solution)

    make_list(@challenge, @solution)

    redirect_to root_path

  end

  private
  def challenge_params
    params.require(:challenge).permit(:description, :challengeimage, :solution, :solved)
  end
end
