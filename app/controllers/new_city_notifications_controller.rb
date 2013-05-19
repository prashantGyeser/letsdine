class NewCityNotificationsController < ApplicationController
  # GET /new_city_notifications
  # GET /new_city_notifications.json
  def index
    @new_city_notifications = NewCityNotification.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @new_city_notifications }
    end
  end

  # GET /new_city_notifications/1
  # GET /new_city_notifications/1.json
  def show
    @new_city_notification = NewCityNotification.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @new_city_notification }
    end
  end

  # GET /new_city_notifications/new
  # GET /new_city_notifications/new.json
  def new
    @new_city_notification = NewCityNotification.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @new_city_notification }
    end
  end

  # GET /new_city_notifications/1/edit
  def edit
    @new_city_notification = NewCityNotification.find(params[:id])
  end

  # POST /new_city_notifications
  # POST /new_city_notifications.json
  def create
    @new_city_notification = NewCityNotification.new(params[:new_city_notification])


    respond_to do |format|
      if @new_city_notification.save
        format.html { redirect_to @new_city_notification, notice: 'New city notification was successfully created.' }
        format.json { render json: @new_city_notification, status: :created, location: @new_city_notification }
      else
        format.html { render action: "new" }
        format.json { render json: @new_city_notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /new_city_notifications/1
  # PUT /new_city_notifications/1.json
  def update
    @new_city_notification = NewCityNotification.find(params[:id])

    respond_to do |format|
      if @new_city_notification.update_attributes(params[:new_city_notification])
        format.html { redirect_to @new_city_notification, notice: 'New city notification was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @new_city_notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /new_city_notifications/1
  # DELETE /new_city_notifications/1.json
  def destroy
    @new_city_notification = NewCityNotification.find(params[:id])
    @new_city_notification.destroy

    respond_to do |format|
      format.html { redirect_to new_city_notifications_url }
      format.json { head :no_content }
    end
  end
end
