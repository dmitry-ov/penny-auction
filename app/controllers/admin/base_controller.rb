class Admin::BaseController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #before_action :authenticate_user!
  #before_action :require_admin


  before_action :authenticate_user!
  before_action :require_admin

  layout "admin"

  private
    def require_admin
      unless current_user.is_admin
        flash[:error] = "You must be logged in as admin to access this section"
        redirect_to root_path # halts request cycle
      end
    end
end
