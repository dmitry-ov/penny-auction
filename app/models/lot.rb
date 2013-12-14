class Lot < ActiveRecord::Base
  belongs_to :product  
  
  validates :step_price, presence: true, numericality: { greater_than: 0 }
end
