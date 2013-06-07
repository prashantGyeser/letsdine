require 'spec_helper'

describe "experiences/edit" do
  before(:each) do
    @experience = assign(:experience, stub_model(Experience,
      :name => "MyString",
      :about => "MyText",
      :address => "MyString",
      :city => "MyString",
      :cost => 1,
      :min_pax => 1,
      :experience_picture => "MyString"
    ))
  end

  it "renders the edit experience form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", experience_path(@experience), "post" do
      assert_select "input#experience_name[name=?]", "experience[name]"
      assert_select "textarea#experience_about[name=?]", "experience[about]"
      assert_select "input#experience_address[name=?]", "experience[address]"
      assert_select "input#experience_city[name=?]", "experience[city]"
      assert_select "input#experience_cost[name=?]", "experience[cost]"
      assert_select "input#experience_min_pax[name=?]", "experience[min_pax]"
      assert_select "input#experience_experience_picture[name=?]", "experience[experience_picture]"
    end
  end
end
