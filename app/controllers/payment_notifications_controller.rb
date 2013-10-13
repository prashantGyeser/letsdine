class PaymentNotificationsController < ApplicationController
  
  # The create method will be accessed by the IPay88 callback. Removing the protection so that it can write to the db from this create method and only from the create method.
  protect_from_forgery :except => :create
  skip_before_filter :verify_authenticity_token, :except => [:create]

  # GET /payment_notifications/1
  # GET /payment_notifications/1.json
  def show
    @payment_notification = PaymentNotification.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @payment_notification }
    end
  end

  #public 
  # POST /payment_notifications
  # POST /payment_notifications.json
  def create
    @payment_notification = PaymentNotification.new(:params => params, :status => params[:Status], :ref_id => params[:RefNo], :error_description => params[:ErrDesc])
    # Todo: Change the value sent as the ref_id to the ipay88 server to the actual cart id. For now I have done a quick and dirty removing the first 5 characters. This needs to be made more robust.
    # Todo: Need to check the signature before writing to the db
    reference_id = params[:RefNo]
    cart_id = reference_id[5..-1].to_i
    @payment_notification.cart_id = cart_id
    @cart = Cart.find(@payment_notification.cart_id)

    session[:payment_notification] = @payment_notification

    respond_to do |format|
      if @payment_notification.save
        format.html { redirect_to carts_status_path, notice: 'Check your status below.' }

        #format.json { render json: @payment_notification, status: :created, location: @payment_notification }
      else
        format.html { render action: "new" }
        format.json { render json: @payment_notification.errors, status: :unprocessable_entity }
      end
    end
  end

end
