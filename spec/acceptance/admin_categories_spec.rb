require 'acceptance/acceptance_helper'

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


  feature 'Admin can' do
    background do
      visit path
      sign_in_with email, password
    end

    context 'ajax', js: true  do
      scenario 'add category' do
        expect(current_path).to be_eql admin_categories_path

        name_child = 'iPhone 5'
        fill_in 'Name', with: name_child
        select name, from: 'category_ancestry'
        pending 'add picture to category'
        click_button 'Save'

        expect(page).to have_content name
        expect(page).to have_content name_child
      end

      scenario 'destroy category' do
        expect(page).to have_content 'Destroy'
        click_on 'Destroy'
        page.driver.accept_js_confirms!
        #page.driver.browser.switch_to.alert.accept

        expect(page).to have_content 'Управление категориями'
        expect(page).to have_content 'Name'
        expect(page).to have_content 'Parent category'
        expect(page).to have_button 'Save'
      end
    end

    scenario 'view categories list' do
      expect(page).to have_content 'Управление категориями'
      expect(page).to have_content name
      expect(page).to have_link 'Show'
      expect(page).to have_link 'Edit'
      expect(page).to have_link 'Destroy'
    end

    scenario 'show category' do
      click_on 'Show'
      expect(page).to have_content name
      expect(page).to have_link 'Edit'
      expect(page).to have_link 'Back'
    end

    scenario 'edit category' do
      click_on 'Edit'
      expect(page).to have_field('Name', with: name)
      expect(page).to have_content 'Parent category'
      expect(page).to have_button 'Save'
      expect(page).to have_link 'Show'
      expect(page).to have_link 'Back'
      fill_in 'Name', with: 'htc'
      click_on 'Save'
      expect(page).to have_content 'htc'
    end

  end

end
