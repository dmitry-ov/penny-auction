require 'spec_helper'

describe "pictures/index" do
  before(:each) do
    assign(:pictures, [
      stub_model(Picture),
      stub_model(Picture)
    ])
  end

  it "renders a list of pictures" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
