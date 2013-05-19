require "spec_helper"

describe NewCityNotificationsController do
  describe "routing" do

    it "routes to #index" do
      get("/new_city_notifications").should route_to("new_city_notifications#index")
    end

    it "routes to #new" do
      get("/new_city_notifications/new").should route_to("new_city_notifications#new")
    end

    it "routes to #show" do
      get("/new_city_notifications/1").should route_to("new_city_notifications#show", :id => "1")
    end

    it "routes to #edit" do
      get("/new_city_notifications/1/edit").should route_to("new_city_notifications#edit", :id => "1")
    end

    it "routes to #create" do
      post("/new_city_notifications").should route_to("new_city_notifications#create")
    end

    it "routes to #update" do
      put("/new_city_notifications/1").should route_to("new_city_notifications#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/new_city_notifications/1").should route_to("new_city_notifications#destroy", :id => "1")
    end

  end
end
