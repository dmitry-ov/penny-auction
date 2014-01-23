require 'spec_helper'

feature "Admin can manage products", %q{
  In order to sell the products
  As an admin
  I want to be able to manage products
 } do

  let(:path) { admin_products_path }

  background do
    User.create!(email: 'admin@test.com', password: '12345678', password_confirmation: '12345678', admin: true)
  end

  it_behaves_like "Admin accessible"


  describe 'Admin can' do
    pending 'view products list'
    pending 'add product'
    pending 'show product'
    pending 'edit product'
    pending 'destroy product'
    pending 'click back on new page'
    pending 'click back on show page'
    pending 'click edit on show page'
    pending 'click show on edit page'
    pending 'click back on edit page'
  end


end