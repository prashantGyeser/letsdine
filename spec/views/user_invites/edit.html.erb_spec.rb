require 'spec_helper'

describe "user_invites/edit" do
  before(:each) do
    @user_invite = assign(:user_invite, stub_model(UserInvite,
      :user_id => 1,
      :email_invites => "MyText",
      :facebook_share => "MyString"
    ))
  end

  it "renders the edit user_invite form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_invite_path(@user_invite), "post" do
      assert_select "input#user_invite_user_id[name=?]", "user_invite[user_id]"
      assert_select "textarea#user_invite_email_invites[name=?]", "user_invite[email_invites]"
      assert_select "input#user_invite_facebook_share[name=?]", "user_invite[facebook_share]"
    end
  end
end
