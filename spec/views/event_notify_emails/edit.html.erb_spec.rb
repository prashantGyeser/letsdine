require 'spec_helper'

describe "event_notify_emails/edit" do
  before(:each) do
    @event_notify_email = assign(:event_notify_email, stub_model(EventNotifyEmail,
      :email_address => "MyString",
      :event_id => 1
    ))
  end

  it "renders the edit event_notify_email form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", event_notify_email_path(@event_notify_email), "post" do
      assert_select "input#event_notify_email_email_address[name=?]", "event_notify_email[email_address]"
      assert_select "input#event_notify_email_event_id[name=?]", "event_notify_email[event_id]"
    end
  end
end
