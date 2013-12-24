require 'spec_helper'

describe Category do
  it { should respond_to(:ancestry) }
  it { should validate_presence_of(:name) }
  it { should have_many(:products) }
end
