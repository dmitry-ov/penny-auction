require 'spec_helper'

describe "sites/edit" do
  before(:each) do
    @site = assign(:site, stub_model(Site))
  end

  it "renders the edit site form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", site_path(@site), "post" do
    end
  end
end
