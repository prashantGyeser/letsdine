require 'spec_helper'

describe "event_notify_emails/new" do
  before(:each) do
    assign(:event_notify_email, stub_model(EventNotifyEmail,
      :email_address => "MyString",
      :event_id => 1
    ).as_new_record)
  end

  it "renders new event_notify_email form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", event_notify_emails_path, "post" do
      assert_select "input#event_notify_email_email_address[name=?]", "event_notify_email[email_address]"
      assert_select "input#event_notify_email_event_id[name=?]", "event_notify_email[event_id]"
    end
  end
end
