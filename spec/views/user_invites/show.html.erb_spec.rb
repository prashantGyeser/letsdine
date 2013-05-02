require 'spec_helper'

describe "user_invites/show" do
  before(:each) do
    @user_invite = assign(:user_invite, stub_model(UserInvite,
      :user_id => 1,
      :email_invites => "MyText",
      :facebook_share => "Facebook Share"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/MyText/)
    rendered.should match(/Facebook Share/)
  end
end
