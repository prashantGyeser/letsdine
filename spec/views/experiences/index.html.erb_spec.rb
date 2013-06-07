require 'spec_helper'

describe "experiences/index" do
  before(:each) do
    assign(:experiences, [
      stub_model(Experience,
        :name => "Name",
        :about => "MyText",
        :address => "Address",
        :city => "City",
        :cost => 1,
        :min_pax => 2,
        :experience_picture => "Experience Picture"
      ),
      stub_model(Experience,
        :name => "Name",
        :about => "MyText",
        :address => "Address",
        :city => "City",
        :cost => 1,
        :min_pax => 2,
        :experience_picture => "Experience Picture"
      )
    ])
  end

  it "renders a list of experiences" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Experience Picture".to_s, :count => 2
  end
end
