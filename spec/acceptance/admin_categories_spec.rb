require 'spec_helper'

feature "Admin can manage categories", %q{
  In order to group products by categories
  As an admin
  I want to be able to manage categories
 } do

  let(:path) { admin_categories_path }
  let(:name) { 'Телефоны' }
  let(:email) {'admin@test.com'}
  let(:password) {'12345678'}

  background do
    User.create!(email: email, password: password, password_confirmation: password, admin: true)
    Category.create!(name: name)
  end

  it_behaves_like "Admin accessible"


  context 'ajax' do
    scenario 'add category' do
      visit path
      sign_in_with email, password
      expect(current_path).to be_eql admin_categories_path

      #save_and_open_page

      page.should have_field('Name')
      page.should have_content('Parent category')
      page.should have_button 'Save'

      name_child = 'iPhone 5'
      fill_in 'Name', with: name_child
      select name, from: 'category_ancestry'
      pending 'add picture to category'
      click_button 'Save'

      page.should have_content name
      page.should have_content name_child
    end
  end


  feature 'Admin can' do
      background do
        visit path
        sign_in_with email, password
      end

      scenario 'view categories list' do
        page.should have_content 'Управление категориями'
        page.should have_content name
        page.should have_link 'Show'
        page.should have_link 'Edit'
        page.should have_link 'Destroy'
      end

      scenario 'show category' do
        click_on 'Show'
        page.should have_content name
        page.should have_link 'Edit'
        page.should have_link 'Back'
      end

      scenario 'edit category' do
        click_on 'Edit'
        page.should have_field('Name', with: name)
        page.should have_content 'Parent category'
        page.should have_button 'Save'
        page.should have_link 'Show'
        page.should have_link 'Back'
        fill_in 'Name', with: 'htc'
        click_on 'Save'
        page.should have_content 'htc'
      end

      scenario   'destroy category' do
        click_on 'Destroy'
        page.should_not have_link 'Show'
        page.should_not have_link 'Edit'
        page.should_not have_link 'Destroy'
      end
  end

end
