class Admin::PaymentController < Admin::ApplicationController
  def index
  	@payments = PaymentNotification.all
  	@carts = Cart.all
  end
end
