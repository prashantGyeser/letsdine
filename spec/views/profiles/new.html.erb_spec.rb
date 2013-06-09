require 'spec_helper'

describe "profiles/new" do
  before(:each) do
    assign(:profile, stub_model(Profile,
      :user_id => 1,
      :picture => "MyString",
      :about => "MyText"
    ).as_new_record)
  end

  it "renders new profile form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", profiles_path, "post" do
      assert_select "input#profile_user_id[name=?]", "profile[user_id]"
      assert_select "input#profile_picture[name=?]", "profile[picture]"
      assert_select "textarea#profile_about[name=?]", "profile[about]"
    end
  end
end
