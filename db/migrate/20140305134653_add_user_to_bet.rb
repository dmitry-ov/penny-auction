class AddUserToBet < ActiveRecord::Migration
  def change
    add_reference :bets, :user, index: true
  end
end
