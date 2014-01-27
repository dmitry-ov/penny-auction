require 'spec_helper'

feature "Admin can manage lots", %q{
  In order to sell the lots
  As an admin
  I want to be able to manage lots
 } do

  let(:path) { admin_lots_path }
  let(:date) { DateTime.now + 1.month }

  background do
    User.create!(email: 'admin@test.com', password: '12345678', password_confirmation: '12345678', admin: true)
    Product.create!(title: 'mobile phone', description: 'new iphone', price: 1234567.89)
    Product.create!(title: 'television', description: 'from Samsung', price: 4567.89)
    Lot.create!(step_price: 0.05, expire_date: date, product: Product.first )
  end

  it_behaves_like "Admin accessible"

  feature 'Admin can' do
      background do
        visit path
        sign_in_with 'admin@test.com', '12345678'
      end

      scenario 'view lots list' do
        page.should have_content 'Управление лотами'
        page.should have_link 'New Lot'
        page.should have_link 'Show'
        page.should have_link 'Edit'
        page.should have_link 'Destroy'
      end

      scenario 'new lot' do
        click_on 'New Lot'
        page.should have_content 'Step price'
        page.should have_content 'Expire date'
        page.should have_content 'Product'
        page.should have_button 'Save'
        page.should have_link 'Back'
      end

      scenario 'edit lot' do
        click_on 'Edit'
        fill_in 'Step price', with: '0.11'
        fill_in 'lot_expire_date', with: Lot.first.expire_date + 1.month
        select 'television', from: 'lot_product_id'
        click_button 'Save'
        page.should have_content '0.11'
        page.should have_content Lot.first.expire_date
        page.should have_content 'television'
        page.should have_link 'Edit'
        page.should have_link 'Back'
      end

      scenario 'show lot' do
        click_on 'Show'
        page.should have_content 0.05
        page.should have_content date.year
        page.should have_content date.month
        page.should have_content date.day
        page.should have_content Product.first.title
        save_and_open_page
      end

      scenario 'destroy lot' do
        click_on 'Destroy'
        page.should_not have_link 'Show'
        page.should_not have_link 'Edit'
        page.should_not have_link 'back'
      end
    end
end