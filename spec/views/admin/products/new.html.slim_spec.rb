require 'spec_helper'

describe "admin/products/new" do
  before(:each) do
    assign(:admin_product, stub_model(Admin::Product).as_new_record)
  end

  it "renders new admin_product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", admin_products_path, "post" do
    end
  end
end
