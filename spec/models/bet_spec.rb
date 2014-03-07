require 'spec_helper'

describe Bet do
    it { should belong_to(:user) }
    it { should validate_presence_of(:user) }

    it { should belong_to(:lot) }
    it { should validate_presence_of(:lot) }

    it { should validate_presence_of(:time) }


    it "user have not bets, then bet not be created" do
      User.create!(email: 'admin@test.com', password: '12345678', password_confirmation: '12345678', admin: false, betscount: 0)
      Category.create!(name: "electronic")
      Product.create!(title: 'mobile phone', description: 'new iphone', price: 1234567.89, category: Category.first)
      Lot.create!(step_price: 0.05, price: 15.4, begin_date: DateTime.now - 5.day, expire_date: DateTime.now + 2.day, product: Product.first)
      @bet = Bet.new(user: User.first, lot: Lot.first, time: DateTime.now)
      expect(@bet).not_to be_valid
    end


    pending 'click make bet updates: end time lot and price lot in DB'
    pending 'make bet reduces user.bets_count'
    pending 'make bets click redirect to page login'
    pending 'user have bets before make bet. if bets_count = 0 bet not make'
    pending 'custom validates - message yot have not bets'

end

