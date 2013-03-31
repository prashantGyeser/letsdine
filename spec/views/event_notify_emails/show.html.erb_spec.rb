require 'spec_helper'

describe "event_notify_emails/show" do
  before(:each) do
    @event_notify_email = assign(:event_notify_email, stub_model(EventNotifyEmail,
      :email_address => "Email Address",
      :event_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Email Address/)
    rendered.should match(/1/)
  end
end
