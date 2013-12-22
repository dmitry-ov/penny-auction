require 'spec_helper'

describe "admin/products/index" do
  before(:each) do
    assign(:admin_products, [
      stub_model(Admin::Product),
      stub_model(Admin::Product)
    ])
  end

  it "renders a list of admin/products" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
