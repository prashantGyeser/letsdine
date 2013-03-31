require 'spec_helper'

describe "event_notify_emails/index" do
  before(:each) do
    assign(:event_notify_emails, [
      stub_model(EventNotifyEmail,
        :email_address => "Email Address",
        :event_id => 1
      ),
      stub_model(EventNotifyEmail,
        :email_address => "Email Address",
        :event_id => 1
      )
    ])
  end

  it "renders a list of event_notify_emails" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email Address".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
