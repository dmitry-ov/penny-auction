require 'spec_helper'

describe Lot do

  describe "should have product" do
    it { should belong_to(:product) }
  end

  describe "should have step price " do
    it { should respond_to(:step_price) }
    it { should validate_presence_of(:step_price) }
    it { should validate_numericality_of(:step_price).is_greater_than_or_equal_to BigDecimal.new('0.01') }
  end

  describe "should have expire date" do

    before do
      @lot = Lot.new(:step_price => 0.02)
    end

    it {should validate_presence_of(:expire_date)}

    it "expire date after now" do
      @lot.expire_date = DateTime.now + 1.second
      expect(DateTime.now..DateTime.now+1.year).to cover(@lot.expire_date)
    end

    it "should have expire date before now" do
      @lot.expire_date = DateTime.now - 5.second
      expect(@lot).not_to be_valid
    end

    it "expire date before 1 year" do
      @lot.expire_date = DateTime.now + 1.year -  5.second
      expect(@lot).to be_valid
    end

    it "should have expire date after 1 year" do
      @lot.expire_date = DateTime.now + 1.year +  5.second
      expect(@lot).not_to be_valid
    end
  end

end
