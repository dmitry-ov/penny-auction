class AddPriceToLots < ActiveRecord::Migration
  def change
    add_column :lots, :price, :decimal, :precision => 9, :scale => 2
  end
end
