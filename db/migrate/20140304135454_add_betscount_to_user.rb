class AddBetscountToUser < ActiveRecord::Migration
  def change
    add_column :users, :betscount, :integer
  end
end
