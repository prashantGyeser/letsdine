require 'spec_helper'

describe "payment_notifications/index" do
  before(:each) do
    assign(:payment_notifications, [
      stub_model(PaymentNotification,
        :params => "MyText",
        :cart_id => 1,
        :status => "Status",
        :ref_id => "Ref",
        :error_description => "MyText",
        :create => "Create"
      ),
      stub_model(PaymentNotification,
        :params => "MyText",
        :cart_id => 1,
        :status => "Status",
        :ref_id => "Ref",
        :error_description => "MyText",
        :create => "Create"
      )
    ])
  end

  it "renders a list of payment_notifications" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => "Ref".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Create".to_s, :count => 2
  end
end
