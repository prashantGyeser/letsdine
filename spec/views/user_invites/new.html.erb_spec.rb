require 'spec_helper'

describe "user_invites/new" do
  before(:each) do
    assign(:user_invite, stub_model(UserInvite,
      :user_id => 1,
      :email_invites => "MyText",
      :facebook_share => "MyString"
    ).as_new_record)
  end

  it "renders new user_invite form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_invites_path, "post" do
      assert_select "input#user_invite_user_id[name=?]", "user_invite[user_id]"
      assert_select "textarea#user_invite_email_invites[name=?]", "user_invite[email_invites]"
      assert_select "input#user_invite_facebook_share[name=?]", "user_invite[facebook_share]"
    end
  end
end
