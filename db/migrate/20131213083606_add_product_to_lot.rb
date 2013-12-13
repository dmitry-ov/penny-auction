class AddProductToLot < ActiveRecord::Migration
  def change
    add_reference :lots, :product, index: true
  end
end
