class EventsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  # GET /events
  # GET /events.json
  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    @restaurant = Restaurant.find(@event.restaurant_id)
    @attendee = Attendee.new

    @menu_items = @restaurant.menu_items
    @menu_items_categorized = @menu_items.group_by { |menu_item| menu_item.course_name}
    logger.debug "the grouped menu items are:#{@menu_items_categorized}"
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new
    @restaurants = Restaurant.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    logger.debug "The content in the event param is:#{params[:event]}"
    @event = Event.new(params[:event])
    @restaurants = Restaurant.all
    logger.debug "The content in the events param is: #{params.inspect}"
    logger.debug "The time now is: #{Time.now}"

    invitee_emails = params[:event][:invitees].split(",")

    respond_to do |format|
      if @event.save
      
        if invitee_emails.empty?
        else
          InviteMailer.invite(invitee_emails, current_user.name, @event).deliver  
        end
        
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

  def join
    logger.debug "It is getting to the join controller action"
    @event = Event.find(params[:id])
  end

end
