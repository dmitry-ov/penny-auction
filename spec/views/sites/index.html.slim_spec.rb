require 'spec_helper'

describe "sites/index" do
  before(:each) do
    assign(:sites, [
      stub_model(Site),
      stub_model(Site)
    ])
  end

  it "renders a list of sites" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
