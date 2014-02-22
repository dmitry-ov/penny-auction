class AddBegindateToLot < ActiveRecord::Migration
  def change
    add_column :lots, :begin_date, :datetime
  end
end
