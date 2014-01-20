class AddExpireTimeToLots < ActiveRecord::Migration
  def change
    add_column :lots, :expire_date, :datetime
  end
end
