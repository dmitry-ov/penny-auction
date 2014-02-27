require 'acceptance/acceptance_helper'

feature "Admin can manage products", %q{
  In order to sell the products
  As an admin
  I want to be able to manage products
 } do

  let(:path) { admin_products_path }
  let(:name) { 'Телефоны' }
  let(:title) { 'mobile phone' }
  let(:description) { 'new iphone' }
  let(:price) { 1234567.89 }

  background do
    User.create!(email: 'admin@test.com', password: '12345678', password_confirmation: '12345678', admin: true)
    Category.create!(name: name)
    Product.create!(title: title, description: description, price: price, category: Category.first)
  end

  it_behaves_like "Admin accessible"

    feature 'Admin can' do

      background do
        visit path
        sign_in_with 'admin@test.com', '12345678'
      end

      scenario 'view products list' do
        page.should have_content 'Управление продуктами'
        page.should have_content title
        page.should have_content description
        page.should have_content price
        page.should have_link 'New Product'
        page.should have_link 'Show'
        page.should have_link 'Edit'
        page.should have_link 'Destroy'
      end

      scenario 'add product' do
        click_on 'New Product'
        page.should have_content 'Title'
        page.should have_content 'Description'
        page.should have_content 'Price'
        page.should have_content 'Category'
        page.should have_button 'Save'
        page.should have_link 'Add picture'
        page.should have_link 'Back'
      end

      scenario 'show product' do
        click_on 'Show'
        page.should have_content title
        page.should have_content description
        page.should have_content price
        page.should have_link 'Edit'
        page.should have_link 'Back'
      end

      scenario 'edit product' do
        click_on 'Edit'
        page.should have_field('Title', with: title)
        page.should have_field('Description', with: description)
        page.should have_field('Price', with: price)
        page.should have_button 'Save'
        page.should have_link 'Show'
        page.should have_link 'Back'
      end

      scenario 'destroy product' do
        click_on 'Destroy'
        page.should_not have_content title
        page.should_not have_content description
        page.should_not have_content price
      end

      pending 'add image to product'
      pending 'remove image from product'
      pending 'select category to product in edit and new views'

    end


end