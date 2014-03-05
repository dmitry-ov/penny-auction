class AddLotToBet < ActiveRecord::Migration
  def change
    add_reference :bets, :lot, index: true
  end
end
