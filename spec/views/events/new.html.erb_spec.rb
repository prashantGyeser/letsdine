require 'spec_helper'

describe "events/new" do
  before(:each) do
    assign(:event, stub_model(Event,
      :event_name => "MyString",
      :event_description => "MyText",
      :restaurant_id => 1
    ).as_new_record)
  end

  it "renders new event form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", events_path, "post" do
      assert_select "input#event_event_name[name=?]", "event[event_name]"
      assert_select "textarea#event_event_description[name=?]", "event[event_description]"
      assert_select "input#event_restaurant_id[name=?]", "event[restaurant_id]"
    end
  end
end
