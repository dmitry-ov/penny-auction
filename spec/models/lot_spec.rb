require 'spec_helper'

describe Lot do
  it { should respond_to(:step_price) }
  it { should validate_presence_of(:step_price) }
  it { should validate_numericality_of(:step_price).is_greater_than_or_equal_to(0) }

  pending "have reference with one product"

end
