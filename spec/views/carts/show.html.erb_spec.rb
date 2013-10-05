require 'spec_helper'

describe "carts/show" do
  before(:each) do
    @cart = assign(:cart, stub_model(Cart,
      :seats => 1,
      :cost_per_seat => "9.99",
      :user_id => 2,
      :attendee_id => 3,
      :event_id => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/9.99/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
  end
end
