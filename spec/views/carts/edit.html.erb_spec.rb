require 'spec_helper'

describe "carts/edit" do
  before(:each) do
    @cart = assign(:cart, stub_model(Cart,
      :seats => 1,
      :cost_per_seat => "9.99",
      :user_id => 1,
      :attendee_id => 1,
      :event_id => 1
    ))
  end

  it "renders the edit cart form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", cart_path(@cart), "post" do
      assert_select "input#cart_seats[name=?]", "cart[seats]"
      assert_select "input#cart_cost_per_seat[name=?]", "cart[cost_per_seat]"
      assert_select "input#cart_user_id[name=?]", "cart[user_id]"
      assert_select "input#cart_attendee_id[name=?]", "cart[attendee_id]"
      assert_select "input#cart_event_id[name=?]", "cart[event_id]"
    end
  end
end
