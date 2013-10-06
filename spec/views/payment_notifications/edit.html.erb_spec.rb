require 'spec_helper'

describe "payment_notifications/edit" do
  before(:each) do
    @payment_notification = assign(:payment_notification, stub_model(PaymentNotification,
      :params => "MyText",
      :cart_id => 1,
      :status => "MyString",
      :ref_id => "MyString",
      :error_description => "MyText",
      :create => "MyString"
    ))
  end

  it "renders the edit payment_notification form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", payment_notification_path(@payment_notification), "post" do
      assert_select "textarea#payment_notification_params[name=?]", "payment_notification[params]"
      assert_select "input#payment_notification_cart_id[name=?]", "payment_notification[cart_id]"
      assert_select "input#payment_notification_status[name=?]", "payment_notification[status]"
      assert_select "input#payment_notification_ref_id[name=?]", "payment_notification[ref_id]"
      assert_select "textarea#payment_notification_error_description[name=?]", "payment_notification[error_description]"
      assert_select "input#payment_notification_create[name=?]", "payment_notification[create]"
    end
  end
end
