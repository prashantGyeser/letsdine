require 'spec_helper'

describe "user_invites/index" do
  before(:each) do
    assign(:user_invites, [
      stub_model(UserInvite,
        :user_id => 1,
        :email_invites => "MyText",
        :facebook_share => "Facebook Share"
      ),
      stub_model(UserInvite,
        :user_id => 1,
        :email_invites => "MyText",
        :facebook_share => "Facebook Share"
      )
    ])
  end

  it "renders a list of user_invites" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Facebook Share".to_s, :count => 2
  end
end
