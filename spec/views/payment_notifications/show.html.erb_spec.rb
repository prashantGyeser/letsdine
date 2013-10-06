require 'spec_helper'

describe "payment_notifications/show" do
  before(:each) do
    @payment_notification = assign(:payment_notification, stub_model(PaymentNotification,
      :params => "MyText",
      :cart_id => 1,
      :status => "Status",
      :ref_id => "Ref",
      :error_description => "MyText",
      :create => "Create"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(/1/)
    rendered.should match(/Status/)
    rendered.should match(/Ref/)
    rendered.should match(/MyText/)
    rendered.should match(/Create/)
  end
end
