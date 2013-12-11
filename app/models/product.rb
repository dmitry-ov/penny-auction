class Product < ActiveRecord::Base
 validates_presence_of :title, :price
 validates_uniqueness_of :title

 validates_numericality_of :price, greater_than_or_equal_to: 1
 validates_length_of :title, in: 4..120
end
