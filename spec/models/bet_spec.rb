require 'spec_helper'

describe Bet do

  let(:user) { User.create!(email: 'admin@test.com', password: '12345678', password_confirmation: '12345678', admin: false, betscount: 0) }
  let(:category) { Category.create!(name: "electronic") }
  let(:product) { Product.create!(title: 'mobile phone', description: 'new iphone', price: 1234567.89, category: category) }
  let(:lot) { Lot.create!(step_time: 2, step_price: 0.05, price: 15.4, begin_date: DateTime.now - 5.day, expire_date: DateTime.now + 2.day, product: product) }

  it { should belong_to(:user) }
  it { should belong_to(:lot) }

  describe "validations" do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:lot) }
  end

  describe "user bets" do
    it "have count of bets, then bet be created" do
      user.update(betscount: 1)
      @bet = Bet.new(user: user, lot: lot)
      expect(@bet).to be_valid
    end

    it "not have count of bets, then bet not be created" do
      @bet = Bet.new(user: user, lot: lot)
      expect(@bet).not_to be_valid
    end

    context "after create bet" do
      before do
        user.update(betscount: 1)
      end

      it "change user.bets_count" do
        expect { Bet.create(user: user, lot: lot) }.to change(user, :betscount)
      end

      it "change lot.price" do
        expect { Bet.create(user: user, lot: lot) }.to change(lot, :price)
      end

      it "change lot.expire_date" do
        expect { Bet.create(user: user, lot: lot) }.to change(lot, :expire_date)
      end
    end

    describe "try stubs" do

      let(:bet) {Bet.new(user: user, lot: lot)}

      before do
        user.update(betscount: 1)
      end

      it "bet.save! call lot.increase_price" do
        expect(lot).to receive(:increase_price)
        bet.save!
      end

    end

    end


  pending 'make bets click redirect to page login'
  pending 'custom validates - message yot have not bets'

end

