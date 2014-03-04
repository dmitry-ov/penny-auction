class AddSteptimeToLot < ActiveRecord::Migration
  def change
    add_column :lots, :step_time, :integer
  end
end
