require 'spec_helper'

describe Bet do

  let(:user) { User.create!(email: 'admin@test.com', password: '12345678', password_confirmation: '12345678', admin: false, betscount: 0) }

  it { should belong_to(:user) }
  it { should belong_to(:lot) }

  describe "validations" do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:lot) }
  end

  it "user have not bets, then bet not be created" do
    #User.create!(email: 'admin@test.com', password: '12345678', password_confirmation: '12345678', admin: false, betscount: 0)
    Category.create!(name: "electronic")
    Product.create!(title: 'mobile phone', description: 'new iphone', price: 1234567.89, category: Category.first)
    Lot.create!(step_time: 2, step_price: 0.05, price: 15.4, begin_date: DateTime.now - 5.day, expire_date: DateTime.now + 2.day, product: Product.first)
    @bet = Bet.create!(user: user, lot: Lot.first)

    #@bet.create!
    puts @bet.errors.to_a.to_s



    expect(@bet).not_to be_valid
  end

  #it "click make bet updates: end time lot and price lot in DB" do
    #update_lot_and_time


  #end

  pending 'make bet reduces user.bets_count'
  pending 'make bets click redirect to page login'
  pending 'user have bets before make bet. if bets_count = 0 bet not make'
  pending 'custom validates - message yot have not bets'

end

