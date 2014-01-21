require 'spec_helper'

feature "Admin can manage lots", %q{
  In order to sell the lots
  As an admin
  I want to be able to manage lots
 } do

  let(:path) { admin_lots_path }

  background do
    User.create!(email: 'admin@test.com', password: '12345678', password_confirmation: '12345678', admin: true)
  end

  it_behaves_like "Admin accessible"

  scenario 'Admin can view lots list' do
    pending
  end

end