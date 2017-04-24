class ChallengeSolutionController < ApplicationController
  def update
    @challenge = Challenge.find(params[:id])
    @challenge.update(challenge_params)
    @solution = Solution.find(@challenge.solution)
    @solver = User.find(@solution.user_id)

    make_list(@challenge, @solution)
    @solver.tag_user(@challenge)

    ModelMailer.successful_solution(@challenge, @solution).deliver

    redirect_to root_path

  end

  private
  def challenge_params
    params.require(:challenge).permit(:description, :challengeimage, :solution, :solved)
  end
end
