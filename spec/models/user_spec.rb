require 'spec_helper'

describe User do
  it { should respond_to(:betscount) }
  it { should validate_presence_of(:betscount) }
end
