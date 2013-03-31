class EventNotifyEmailsController < ApplicationController
  # GET /event_notify_emails
  # GET /event_notify_emails.json
  def index
    @event_notify_emails = EventNotifyEmail.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @event_notify_emails }
    end
  end

  # GET /event_notify_emails/1
  # GET /event_notify_emails/1.json
  def show
    @event_notify_email = EventNotifyEmail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event_notify_email }
    end
  end

  # GET /event_notify_emails/new
  # GET /event_notify_emails/new.json
  def new
    @event_notify_email = EventNotifyEmail.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event_notify_email }
    end
  end

  # GET /event_notify_emails/1/edit
  def edit
    @event_notify_email = EventNotifyEmail.find(params[:id])
  end

  # POST /event_notify_emails
  # POST /event_notify_emails.json
  def create
    @event_notify_email = EventNotifyEmail.new(params[:event_notify_email])

    respond_to do |format|
      if @event_notify_email.save
        event = Event.find(@event_notify_email.event_id)
        format.html { redirect_to event_path(event), notice: 'Your email address was successfully saved. We will notify you soon' }
        format.json { render json: @event_notify_email, status: :created, location: @event_notify_email }
      else
        format.html { render action: "new" }
        format.json { render json: @event_notify_email.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /event_notify_emails/1
  # PUT /event_notify_emails/1.json
  def update
    @event_notify_email = EventNotifyEmail.find(params[:id])

    respond_to do |format|
      if @event_notify_email.update_attributes(params[:event_notify_email])
        format.html { redirect_to @event_notify_email, notice: 'Event notify email was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event_notify_email.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_notify_emails/1
  # DELETE /event_notify_emails/1.json
  def destroy
    @event_notify_email = EventNotifyEmail.find(params[:id])
    @event_notify_email.destroy

    respond_to do |format|
      format.html { redirect_to event_notify_emails_url }
      format.json { head :no_content }
    end
  end
end
