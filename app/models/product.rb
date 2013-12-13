class Product < ActiveRecord::Base
 validates_presence_of :title
 validates_uniqueness_of :title
 validates_length_of :title, in: 4..120

 validates_presence_of :price
 validates_numericality_of :price, greater_than_or_equal_to: 1
 
 has_many :lots, dependent: :destroy
end
