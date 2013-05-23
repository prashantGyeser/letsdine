class EventsController < ApplicationController
  
  before_filter :authenticate_user!, :except => [:show, :index]

  # GET /events
  # GET /events.json
  def index
    #@events = Event.all.reverse
    if session[:city].nil?
      if params[:city]
        @user_city = params[:city]
        session[:city] = params[:city]
      else
        @user_city = request.location.city
        session[:city] = request.location.city
      end
    elsif params[:city]
      @user_city = params[:city]
      session[:city] = params[:city]
    elsif session[:city]
      @user_city = session[:city]
    end

    # @events = Event.find(:all, :conditions => ["event_type != 'private'"], :order => 'status DESC')
    if session[:city].nil?
    else
      @events = Event.limit(8)
      @events = @events.where('event_type != ?', 'private')
      @events = @events.where('status != ?', 'closed')
      #@events = Event.find(:all, :conditions => ["event_type != 'private' AND status != 'closed'"], :limit => 8 )
      # Taken from http://stackoverflow.com/questions/9970300/how-to-chain-where-query-in-rails-3-active-record
      @events = @events.where('city = ?', session[:city])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    logger.debug "the params in the event show is: #{params.inspect}"
    logger.debug "the id in the event show is: #{params[:id]}"
    event_with_token = Event.where(:token => params[:id])
    @user_invite = UserInvite.new
    logger.debug "The ip is:#{request.ip}"    
    logger.debug "The city is:#{request.location.city}"    
    logger.debug "The country is:#{request.location.country}"    
    if session[:joined]
      @just_joined = true
      session.delete :joined
    end

    if event_with_token.empty?
      @event = Event.find(params[:id])
      if @event.event_type == "private"
        @event = nil
      end
    else
      # The where clause returns an active record relationship and not the instance of the model. The first gets the model instance. 
      # Refer to: http://stackoverflow.com/a/6004962
      # Todo: Need to check if there are multiple records returned
      events_retured_by_where = Event.where(:token => params[:id])
      @event = events_retured_by_where.first
    end
    
    @restaurant = Restaurant.find(@event.restaurant_id)
    @attendee = Attendee.new
    @event_notify_email = EventNotifyEmail.new
    @seats_left = @event.max_seats - Attendee.where(:event_id => @event.id).count
    
    if @seats_left <= 0
      @event.status = "full"
      @event.save
    end
    @already_signed_up = false

    if current_user.nil?

    else
      peopleAttending = Attendee.where(:user_id => current_user.id, :event_id => @event.id)
      if peopleAttending.empty?
        @already_signed_up = false
      else
        @already_signed_up = true  
      end
    end
    
    if session[:attendee_errors]
      session[:attendee_errors].each {|error, error_message| @attendee.errors.add error, error_message}
      session.delete :attendee_errors
    end

    @menu_items = @restaurant.menu_items
    @menu_items_categorized = @menu_items.group_by { |menu_item| menu_item.course_name}
    
    
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
    @event = Event.new(params[:event])
    @restaurants = Restaurant.all

    @event.status = "open"

    invitee_emails = params[:event][:invitees].split(",")

    @event.city = params[:city]

    respond_to do |format|
      if @event.save

        if invitee_emails.empty?
        else
          InviteMailer.invite(invitee_emails, current_user.name, @event).deliver  
        end
        
        Notifications.event_created(current_user.email, @event, Restaurant.find(@event.restaurant_id)).deliver

        if current_user.oauth_token.nil?
        else
          if params[:facebook_share] == "true"          
            message_to_post_to_facebook = current_user.name + " is attending " + @event.event_name + ". You can join your friend by going to " + root_url + event_path(@event)
            current_user.facebook.put_wall_post(message_to_post_to_facebook)
          end
        end
        
        if @event.event_type == 'private'
          path_to_redirect_to = '/events/' + @event.token
          format.html { redirect_to path_to_redirect_to, notice: 'Event was successfully created.' }
        else
          format.html { redirect_to @event, notice: 'Event was successfully created.' }
          format.json { render json: @event, status: :created, location: @event }
        end
        
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
