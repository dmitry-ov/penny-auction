require 'spec_helper'

feature "Admin can manage categories", %q{
  In order to group products by categories
  As an admin
  I want to be able to manage categories
 } do

  let(:path) { admin_categories_path }
  let(:name) { 'Телефоны' }

  background do
    User.create!(email: 'admin@test.com', password: '12345678', password_confirmation: '12345678', admin: true)
    Category.create!(name: name)
  end

  it_behaves_like "Admin accessible"

  feature 'Admin can' do
      background do
        visit path
        sign_in_with 'admin@test.com', '12345678'
      end

      scenario 'Admin can view categories list' do
        page.should have_content 'Управление категориями'
        page.should have_content name
        page.should have_link 'Show'
        page.should have_link 'Edit'
        page.should have_link 'Destroy'
      end

      scenario 'add category' do
        name_child = 'iPhone 5'
        click_on 'New Category'

        page.should have_field('Name')
        page.should have_content('Parent category')
        page.should have_button 'Save'
        page.should have_link 'Back'

        fill_in 'Name', with: name_child
        select name, from: 'category_ancestry'
        pending 'add picture to category'
        click_button 'Save'

        page.should have_content name
        page.should have_content name_child
        page.should have_link 'Edit'
        page.should have_link 'Back'
      end

      scenario 'show category' do
        click_on 'Show'
        page.should have_content name
        page.should have_link 'Edit'
        page.should have_link 'Back'
      end

      scenario  'edit category' do
        pending  'change all inside'
      end

      scenario   'destroy category' do
        click_on 'Destroy'
        page.should_not have_link 'Show'
        page.should_not have_link 'Edit'
        page.should_not have_link 'Destroy'
      end
  end

end
