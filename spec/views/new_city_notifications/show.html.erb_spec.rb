require 'spec_helper'

describe "new_city_notifications/show" do
  before(:each) do
    @new_city_notification = assign(:new_city_notification, stub_model(NewCityNotification,
      :city => "City",
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/City/)
    rendered.should match(/Email/)
  end
end
