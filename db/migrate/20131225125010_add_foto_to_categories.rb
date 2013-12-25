class AddFotoToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :avatar, :string
  end
end
