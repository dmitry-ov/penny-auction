class CreateLots < ActiveRecord::Migration
  def change
    create_table :lots do |t|
      t.decimal :step_price

      t.timestamps
    end
  end
end
