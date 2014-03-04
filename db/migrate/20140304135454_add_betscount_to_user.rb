class AddBetscountToUser < ActiveRecord::Migration
  def change
    add_column :users, :betscount, :integer, default: 0
  end
end
