class Admin::BaseController < ApplicationController
#class Admin::BaseController < InheritedResources::Base
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
        flash[:notice] = "У вас нет прав доступа к этой странице"
        redirect_to root_path # halts request cycle
      end
    end
end
