require 'spec_helper'

describe User do
  it { should respond_to(:betscount) }
  it { should validate_presence_of(:betscount) }
  it { should validate_numericality_of(:betscount).is_greater_than_or_equal_to(0) }

end
