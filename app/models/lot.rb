class Lot < ActiveRecord::Base
  validates_presence_of :step_price
  validates_numericality_of :step_price, greater_than: 0

   belongs_to :product  
end
