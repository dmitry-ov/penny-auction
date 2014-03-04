require 'acceptance/acceptance_helper'

feature  'show lot' do

  let(:title) { 'mobile phone' }
  let(:price) { 1511.14 }

  before do
    Category.create!(name: "Телефоны")
    Product.create!(title: title, description: 'new iphone 5s', price: 12567.89, category: Category.first)
    Lot.create!(step_price: 0.01, price: price, product: Product.first, begin_date: DateTime.now + 1.day, expire_date: DateTime.now + 2.day )
    Lot.create!(step_price: 0.02, price: price, product: Product.first, begin_date: DateTime.now - 1.day, expire_date: DateTime.now + 2.day )
    Lot.create!(step_price: 0.03, price: price, product: Product.first, begin_date: DateTime.now - 2.day, expire_date: DateTime.now - 1.day )
  end

  scenario "show lot active" do
    visit "/lots/#{Lot.find_by_step_price(0.02).id}"
    page.should have_content 'Наименование'
    page.should have_content 'Цена'
    page.should have_content 'Изображение'
    page.should have_content 'Шаг цены'
    page.should have_content 'Время окончания'
    page.should have_content title
    page.should have_content price
  end

  scenario "show lot future" do
    visit "/lots/#{Lot.find_by_step_price(0.01).id}"
    page.should have_content 'Наименование'
    page.should have_content 'Цена'
    page.should have_content 'Изображение'
    page.should have_content 'Шаг цены'
    page.should have_content 'Время начала'
    page.should have_content title
    page.should have_content price
    end

  scenario "show lot finished" do
    visit "/lots/#{Lot.find_by_step_price(0.03).id}"
    page.should have_content 'Наименование'
    page.should have_content 'Цена'
    page.should have_content 'Изображение'
    page.should have_content 'Шаг цены'
    page.should have_content 'Закончен'
    page.should have_content title
    page.should have_content price
  end
end


