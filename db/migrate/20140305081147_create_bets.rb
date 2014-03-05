class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.datetime :time

      t.timestamps
    end
  end
end
