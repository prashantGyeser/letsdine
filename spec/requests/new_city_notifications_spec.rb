require 'spec_helper'

describe "NewCityNotifications" do
  describe "GET /new_city_notifications" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get new_city_notifications_path
      response.status.should be(200)
    end
  end
end
