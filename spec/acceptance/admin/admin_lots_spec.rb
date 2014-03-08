require 'acceptance/acceptance_helper'

feature "Admin can manage lots", %q{
  In order to sell the lots
  As an admin
  I want to be able to manage lots
 } do

  let(:path) { admin_lots_path }
  let(:name) { 'Телефоны' }
  let(:begindate) { DateTime.now - 10.day }
  let(:expiredate) { DateTime.now + 10.day }

  background do
    User.create!(email: 'admin@test.com', password: '12345678', password_confirmation: '12345678', admin: true)
    Category.create!(name: name)
    Product.create!(title: 'mobile phone', description: 'new iphone', price: 1234567.89, category: Category.first)
    Product.create!(title: 'television', description: 'from Samsung', price: 4567.89, category: Category.first)
    Lot.create!(step_time: 60, step_price: 0.05, price: 555.44, begin_date: begindate, expire_date: expiredate, product: Product.first )
  end

  it_behaves_like "Admin accessible"

  feature 'Admin can' do
      background do
        visit path
        sign_in_with 'admin@test.com', '12345678'
      end

      scenario 'view lots list' do
        expect(page).to have_content 'Управление лотами'
        expect(page).to have_link 'New Lot'
        expect(page).to have_link 'Show'
        expect(page).to have_link 'Edit'
        expect(page).to have_link 'Destroy'

        expect(page).to have_content 'Шаг цены'
        expect(page).to have_content 'Цена'
        expect(page).to have_content 'Дата начала'
        expect(page).to have_content 'Дата окончания'
        expect(page).to have_content 'Продукт'
        expect(page).to have_content 'Шаг времени'
      end

      scenario 'new lot' do
        click_on 'New Lot'
        expect(page).to have_content 'Step price'
        expect(page).to have_content 'Price'
        expect(page).to have_content 'Begin date'
        expect(page).to have_content 'Expire date'
        expect(page).to have_content 'Step time'
        expect(page).to have_content 'Product'
        expect(page).to have_button 'Save'
        expect(page).to have_link 'Back'
      end

      scenario 'edit lot' do
        click_on 'Edit'

        date_begin = Lot.first.begin_date - 1.month
        date_expire = Lot.first.expire_date + 1.month

        fill_in 'Step price', with: '0.11'
        fill_in 'Price', with: '777.99'
        fill_in 'Begin date', with: date_begin
        fill_in 'Expire date', with: date_expire
        fill_in 'Step time', with: '120'
        select 'television', from: 'lot_product_id'
        click_button 'Save'

        expect(page).to have_content '0.11'
        expect(page).to have_content '777.99'
        expect(page).to have_content '120'
        expect(page).to have_content date_begin
        expect(page).to have_content date_expire
        expect(page).to have_content 'television'
        expect(page).to have_link 'Edit'
        expect(page).to have_link 'Back'
      end

      scenario 'show lot' do
        click_on 'Show'

        expect(page).to have_content 'Шаг цены'
        expect(page).to have_content 0.05

        expect(page).to have_content 'Цена'
        expect(page).to have_content 555.44

        expect(page).to have_content 'Шаг времени'
        expect(page).to have_content 60

        expect(page).to have_content 'Дата начала'
        expect(page).to have_content begindate.year
        expect(page).to have_content begindate.month
        expect(page).to have_content begindate.day

        expect(page).to have_content 'Дата окончания'
        expect(page).to have_content expiredate.year
        expect(page).to have_content expiredate.month
        expect(page).to have_content expiredate.day

        expect(page).to have_content 'Товар'
        expect(page).to have_content Product.first.title
      end

      scenario 'destroy lot' do
        click_on 'Destroy'
        expect(page).to_not have_link 'Show'
        expect(page).to_not have_link 'Edit'
        expect(page).to_not have_link 'back'
      end
    end
end