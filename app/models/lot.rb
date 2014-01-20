class Lot < ActiveRecord::Base
  belongs_to :product  
  
  validates :step_price, presence: true, numericality: {greater_than_or_equal_to: 0.01}
  validates :expire_date, presence: true, timeliness: { on_or_after: lambda{ DateTime.now }, on_or_before: lambda{ DateTime.now + 1.year }, allow_blank: false }
end
