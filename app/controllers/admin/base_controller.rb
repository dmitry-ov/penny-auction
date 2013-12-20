class Admin::BaseController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :require_admin
  layout "admin"

  private
    def require_admin
      unless user_signed_in? && current_user.is_admin
        flash[:error] = "You must be logged in as admin to access this section"
        redirect_to new_user_session_url # halts request cycle
      end
    end
end
