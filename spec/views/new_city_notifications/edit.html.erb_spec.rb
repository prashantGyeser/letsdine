require 'spec_helper'

describe "new_city_notifications/edit" do
  before(:each) do
    @new_city_notification = assign(:new_city_notification, stub_model(NewCityNotification,
      :city => "MyString",
      :email => "MyString"
    ))
  end

  it "renders the edit new_city_notification form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", new_city_notification_path(@new_city_notification), "post" do
      assert_select "input#new_city_notification_city[name=?]", "new_city_notification[city]"
      assert_select "input#new_city_notification_email[name=?]", "new_city_notification[email]"
    end
  end
end
