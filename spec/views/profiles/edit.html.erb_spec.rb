require 'spec_helper'

describe "profiles/edit" do
  before(:each) do
    @profile = assign(:profile, stub_model(Profile,
      :user_id => 1,
      :picture => "MyString",
      :about => "MyText"
    ))
  end

  it "renders the edit profile form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", profile_path(@profile), "post" do
      assert_select "input#profile_user_id[name=?]", "profile[user_id]"
      assert_select "input#profile_picture[name=?]", "profile[picture]"
      assert_select "textarea#profile_about[name=?]", "profile[about]"
    end
  end
end
