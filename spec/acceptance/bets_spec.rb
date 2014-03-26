require 'acceptance/acceptance_helper'

feature 'bet create' do
  let(:button) { 'Make a Bet!' }

  before do
    User.create!(email: 'user@test.com', password: '12345678', password_confirmation: '12345678',
                 admin: false, betscount: 0)
    Category.create!(name: "Телефоны")
    Product.create!(title: 'mobile phone', description: 'new iphone 5s', price: 12567.89, category: Category.first)
    Lot.create!(step_time: 1, step_price: 0.02, price: 1511.14, product: Product.first, begin_date: DateTime.now - 1.day, expire_date: DateTime.now + 2.day )
  end

  feature "redirect if guest make bet", js: true  do
    background do
      visit "/lots/#{Lot.first.id}"
    end

    scenario "redirect" do
      click_button button
      expect(page).to have_content 'Список аукционов'
    end
  end

    feature "user have not betscount", js: true do
    background do
      visit '/users/sign_in'
      sign_in_with 'user@test.com', '12345678'
      visit "/lots/#{Lot.first.id}"
    end

    scenario "not create bet" do
      click_button button
      expect(page).to have_content 'У вас нет ставок'
    end
  end

  feature "user have betscount" do
    let(:lot_path) { "/lots/#{Lot.first.id}" }

    background do
      User.first.update(betscount: 1)
      visit '/users/sign_in'
      sign_in_with 'user@test.com', '12345678'
      visit lot_path
    end

    scenario "create bet" do
      expect(page).to have_content 'Bets 1'
      click_button button
      visit lot_path
      expect(page).to have_content 'Bets 0'
    end
  end
end
