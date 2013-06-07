require 'spec_helper'

describe "experiences/show" do
  before(:each) do
    @experience = assign(:experience, stub_model(Experience,
      :name => "Name",
      :about => "MyText",
      :address => "Address",
      :city => "City",
      :cost => 1,
      :min_pax => 2,
      :experience_picture => "Experience Picture"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/Address/)
    rendered.should match(/City/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Experience Picture/)
  end
end
