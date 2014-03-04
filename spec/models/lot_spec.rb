require 'spec_helper'

describe Lot do

  it { should belong_to(:product) }
  it { should have_many(:bets) }

  describe "step price " do
    it { should respond_to(:step_price) }
    it { should validate_presence_of(:step_price) }
    it { should validate_numericality_of(:step_price).is_greater_than_or_equal_to BigDecimal.new('0.01') }
  end

  describe "price" do
    it { should respond_to(:price) }
    it { should validate_presence_of(:price) }
    it { should validate_numericality_of(:price).is_greater_than_or_equal_to BigDecimal.new('1') }
  end

  describe "step time" do
    it { should respond_to(:step_time) }
    it { should validate_presence_of(:step_time) }
    it { should validate_numericality_of(:step_time).is_greater_than_or_equal_to(1) }
  end

  describe "begin date" do
    it { should respond_to(:begin_date) }
    it { should validate_presence_of(:begin_date) }
  end

  describe "expire date" do
    it { should respond_to(:begin_date) }
    it { should validate_presence_of(:expire_date) }

    context "begin date less that expire date" do
      before do
        Category.create!(name: "Телефоны")
        Product.create!(title: 'mobile phone', description: 'new iphone 5s', price: 1234567.89,  category: Category.first)
        @lot = Lot.new(step_price: 0.02, price: 5.4, product: Product.first, step_time: 1)
      end

      it "begin date before expire date" do
        @lot.begin_date = DateTime.now
        @lot.expire_date = DateTime.now + 1.month
        expect(@lot).to be_valid
      end
    end
  end

  describe "status" do
    it { should respond_to(:started?) }
    it { should respond_to(:active?) }
    it { should respond_to(:finished?) }

    context "time" do
      before do
        Category.create!(name: "Телефоны")
        Product.create!(title: 'mobile phone', description: 'new iphone 5s', price: 1234567.89, category: Category.first)
        @lot = Lot.new(step_price: 0.02, price: 5.4, product: Product.first)
      end

      it "past" do
        @lot.begin_date = DateTime.now - 3.day
        @lot.expire_date = DateTime.now - 1.day
        expect(@lot.started?).to be_true
        expect(@lot.active?).to be_false
        expect(@lot.finished?).to be_true
        expect(@lot.future?).to be_false
      end

      it "now" do
        @lot.begin_date = DateTime.now - 1.hour
        @lot.expire_date = DateTime.now + 1.day
        expect(@lot.active?).to be_true
        expect(@lot.started?).to be_true
        expect(@lot.finished?).to be_false
        expect(@lot.future?).to be_false
      end

      it "future" do
        @lot.begin_date = DateTime.now + 1.hour
        @lot.expire_date = DateTime.now + 2.day
        expect(@lot.active?).to be_false
        expect(@lot.started?).to be_false
        expect(@lot.finished?).to be_false
        expect(@lot.future?).to be_true
      end
    end
  end


  describe "scope" do
    before do
      Category.create!(name: "Телефоны")
      Product.create!(title: 'mobile phone', description: 'new iphone 5s', price: 1234567.89, category: Category.first)
      @lot = Lot.new(step_price: 0.02, price: 5.4, product: Product.first, step_time: 1 )
    end

    it "scope started" do
      @lot.begin_date =  DateTime.now - 1.hour
      @lot.expire_date = DateTime.now + 1.day
      @lot.save
      expect(Lot.started.size).to eq(1)
    end

    it "scope active" do
      @lot.begin_date =  DateTime.now - 1.hour
      @lot.expire_date = DateTime.now + 1.hour
      @lot.save
      expect(Lot.active.size).to eq(1)
    end

    it "scope finished" do
      @lot.begin_date =  DateTime.now - 1.day
      @lot.expire_date = DateTime.now - 1.hour
      @lot.save
      expect(Lot.finished.size).to eq(1)
      end

    it "scope future" do
      @lot.begin_date =  DateTime.now + 1.day
      @lot.expire_date = DateTime.now + 2.hour
      @lot.save
      expect(Lot.future.size).to eq(1)
    end
  end

  it '#increases price' do
    Category.create!(name: "Телефоны")
    Product.create!(title: 'mobile phone', description: 'new iphone 5s', price: 1234567.89, category: Category.first)
    now = DateTime.now
    @lot = Lot.new(step_time: 1, step_price: 0.02, price: 5.4, product: Product.first, begin_date: now - 1.day, expire_date: now + 1.day)
    expect { @lot.increase_price }.to change(@lot, :price).by(@lot.step_price)
  end

  it '#increase expire_date' do
    Category.create!(name: "Телефоны")
    Product.create!(title: 'mobile phone', description: 'new iphone 5s', price: 1234567.89, category: Category.first)
    now = DateTime.now
    @lot = Lot.new(step_time: 30, step_price: 0.02, price: 5.4, product: Product.first, begin_date: now - 1.day, expire_date: now + 1.day)
    expect { @lot.increase_time }.to change(@lot, :expire_date).by(@lot.step_time)
  end
end
