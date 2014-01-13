require 'spec_helper'

describe "pictures/edit" do
  before(:each) do
    @picture = assign(:picture, stub_model(Picture))
  end

  it "renders the edit picture form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", picture_path(@picture), "post" do
    end
  end
end
