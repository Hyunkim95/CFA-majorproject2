class ModelMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.model_mailer.successful_solution.subject
  #
  def successful_solution(challenge, solution)
    @challenge = challenge
    @solution = solution

    mail to: User.find(solution.user_id).email, subject: "Congratulations, your solution was successful"
  end
end
