class ChangeStepPriceInLot < ActiveRecord::Migration
  def change
    change_column :lots, :step_price, :decimal, :precision => 8, :scale => 2
  end
end
