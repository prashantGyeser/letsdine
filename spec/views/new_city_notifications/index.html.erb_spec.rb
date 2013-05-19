require 'spec_helper'

describe "new_city_notifications/index" do
  before(:each) do
    assign(:new_city_notifications, [
      stub_model(NewCityNotification,
        :city => "City",
        :email => "Email"
      ),
      stub_model(NewCityNotification,
        :city => "City",
        :email => "Email"
      )
    ])
  end

  it "renders a list of new_city_notifications" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
