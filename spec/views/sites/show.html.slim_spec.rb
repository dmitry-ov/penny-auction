require 'spec_helper'

describe "sites/show" do
  before(:each) do
    @site = assign(:site, stub_model(Site))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
