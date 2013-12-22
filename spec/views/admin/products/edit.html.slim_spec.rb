require 'spec_helper'

describe "admin/products/edit" do
  before(:each) do
    @admin_product = assign(:admin_product, stub_model(Admin::Product))
  end

  it "renders the edit admin_product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", admin_product_path(@admin_product), "post" do
    end
  end
end
