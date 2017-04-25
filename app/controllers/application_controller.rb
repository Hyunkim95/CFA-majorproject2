class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Pundit
  before_action :authenticate_user!
  helper_method :mailbox, :conversation

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def mailbox
    @mailbox ||= current_user.mailbox
  end

  def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore

    flash[:error] = t "#{policy_name}.#{exception.query}", scope: "pundit", default: :default
    redirect_to(request.referrer || root_path)
  end

end
