require 'spec_helper'

describe "new_city_notifications/new" do
  before(:each) do
    assign(:new_city_notification, stub_model(NewCityNotification,
      :city => "MyString",
      :email => "MyString"
    ).as_new_record)
  end

  it "renders new new_city_notification form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", new_city_notifications_path, "post" do
      assert_select "input#new_city_notification_city[name=?]", "new_city_notification[city]"
      assert_select "input#new_city_notification_email[name=?]", "new_city_notification[email]"
    end
  end
end
