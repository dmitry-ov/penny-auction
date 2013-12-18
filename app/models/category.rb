class Category < ActiveRecord::Base
 has_ancestry

 has_many :products
 
 validates :name, presence: true
end
