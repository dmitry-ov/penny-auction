class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :avatar
      t.string  :name
      #t.integer :imageable_id
      #t.string  :imageable_type
      t.references :imageable, polymorphic: true
      t.timestamps
    end
  end
end
