class PassthroughController < ApplicationController
  def index
    path = if current_user.has_role? (:developer)
      pages_developer_index_path
    elsif current_user.has_role? (:business_owner)
      pages_business_owner_index_path
    else
    end
    redirect_to path
  end
end
