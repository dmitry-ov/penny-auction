class BetsController < InheritedResources::Base
  belongs_to :lot

  respond_to :js
  actions :create

  before_action :redirect_guest

  def create
    @bet = Bet.new(lot: parent, user: current_user)
    create!
  end

  def redirect_guest
    unless user_signed_in?
      flash[:notice] = "Авторизуйтесь, что бы делать ставки"
      render :js => "window.location = 'http://localhost:3000'"
    end
  end

end
