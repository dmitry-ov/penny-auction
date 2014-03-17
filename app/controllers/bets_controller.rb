class BetsController < InheritedResources::Base
  belongs_to :lot

  respond_to :js
  actions :create


  def create
    @bet = Bet.new(lot: parent, user: current_user)
    create!
  end


end
