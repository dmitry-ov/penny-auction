require 'spec_helper'

describe "sites/new" do
  before(:each) do
    assign(:site, stub_model(Site).as_new_record)
  end

  it "renders new site form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sites_path, "post" do
    end
  end
end
