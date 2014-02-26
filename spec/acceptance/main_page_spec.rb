require 'acceptance/acceptance_helper'

feature 'User show list of lots' do

  before do
    Category.create!(name: "Телефоны")
    Product.create!(title: 'mobile phone', description: 'new iphone 5s', price: 12567.89, category: Category.first)
    Product.create!(title: 'sellular phone', description: 'new iphone 5s', price: 14567.89, category: Category.first)
    Product.create!(title: 'radio phone', description: 'new iphone 5s', price: 34567.89, category: Category.first)

    Lot.create!(step_price: 0.02, price: 1511.14, product: Product.first, begin_date: DateTime.now + 1.day, expire_date: DateTime.now + 2.day )
    Lot.create!(step_price: 0.01, price: 3544.54, product: Product.find(2), begin_date: DateTime.now - 1.day, expire_date: DateTime.now + 1.day )
    Lot.create!(step_price: 0.03, price: 555.39, product: Product.last, begin_date: DateTime.now - 2.day, expire_date: DateTime.now - 1.day )
  end


  scenario  'view lots list' do
    visit '/'
    page.should have_content 'Список аукционов'
    page.should have_content 'Активны'
    page.should have_content 'Начнутся'
    page.should have_content 'Завершенны'

    page.should have_content 'Изображение'
    page.should have_content 'Наименование'
    page.should have_content 'Цена'
    page.should have_content 'Время окончания аукциона'
    page.should have_content 'Шаг цены'

    page.should have_content 'mobile phone'
    page.should have_content 'sellular phone'
    page.should have_content 'radio phone'

    #page.should have_link 'show'
  end
end