require "spec_helper"

describe EventNotifyEmailsController do
  describe "routing" do

    it "routes to #index" do
      get("/event_notify_emails").should route_to("event_notify_emails#index")
    end

    it "routes to #new" do
      get("/event_notify_emails/new").should route_to("event_notify_emails#new")
    end

    it "routes to #show" do
      get("/event_notify_emails/1").should route_to("event_notify_emails#show", :id => "1")
    end

    it "routes to #edit" do
      get("/event_notify_emails/1/edit").should route_to("event_notify_emails#edit", :id => "1")
    end

    it "routes to #create" do
      post("/event_notify_emails").should route_to("event_notify_emails#create")
    end

    it "routes to #update" do
      put("/event_notify_emails/1").should route_to("event_notify_emails#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/event_notify_emails/1").should route_to("event_notify_emails#destroy", :id => "1")
    end

  end
end
