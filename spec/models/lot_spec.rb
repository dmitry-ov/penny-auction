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

  describe "should have begin date" do
    it { should respond_to(:begin_date) }
    it { should validate_presence_of(:begin_date) }
  end

  describe "should have expire date" do
    it { should respond_to(:begin_date) }
    it { should validate_presence_of(:expire_date) }

    context "begin date less that expire date" do
      before do
        Category.create!(name: "Телефоны")
        Product.create!(title: 'mobile phone', description: 'new iphone 5s', price: 1234567.89,  category: Category.first)
        @lot = Lot.new(step_price: 0.02, product: Product.first)
      end

      it "begin date before expire date" do
        @lot.begin_date = DateTime.now
        @lot.expire_date = DateTime.now + 1.month
        expect(@lot).to be_valid
      end
    end
  end

  describe "should have status" do
    it { should respond_to(:started?) }
    it { should respond_to(:active?) }
    it { should respond_to(:finished?) }

    context "time" do
      before do
        Category.create!(name: "Телефоны")
        Product.create!(title: 'mobile phone', description: 'new iphone 5s', price: 1234567.89, category: Category.first)
        @lot = Lot.new(step_price: 0.02, product: Product.first)
      end

      it "past" do
        @lot.begin_date = DateTime.now - 3.day
        @lot.expire_date = DateTime.now - 1.day
        expect(@lot.started?).to be_true
        expect(@lot.active?).to be_false
        expect(@lot.finished?).to be_true
      end

      it "now" do
        @lot.begin_date = DateTime.now - 1.hour
        @lot.expire_date = DateTime.now + 1.day
        expect(@lot.active?).to be_true
        expect(@lot.started?).to be_true
        expect(@lot.finished?).to be_false

      end

      it "future" do
        @lot.begin_date = DateTime.now + 1.hour
        @lot.expire_date = DateTime.now + 2.day
        expect(@lot.active?).to be_false
        expect(@lot.started?).to be_false
        expect(@lot.finished?).to be_false
      end
    end
  end

end
