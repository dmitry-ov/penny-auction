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
      unless current_user.admin?
        redirect_to root_path # halts request cycle
        flash[:notice] = "У вас нет прав доступа к этой странице"
      end
    end
end
