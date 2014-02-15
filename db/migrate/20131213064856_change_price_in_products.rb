class ChangePriceInProducts < ActiveRecord::Migration
  def change
    change_column :products, :price, :decimal, :precision => 9, :scale => 2
  end
end
