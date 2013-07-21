class Admin::EventController < Admin::ApplicationController
	def index
		#@event_list = Event.all.group_by(&:city)
		@event_list = Event.find(:all, :order => "status").reverse
		@event_list = @event_list.group_by(&:city)
		Event.includes(:restaurant).includes(:attendee => :user).where('event_type != ?', 'private').where('status != ?', 'closed').where('city = ?', session[:city]).limit(12)
	end

	# GET /events/new
	# GET /events/new.json
	def new
		@event = Event.new
		@restaurants = Restaurant.all
		@experiences = Experience.all

		respond_to do |format|
			format.html # new.html.erb
			format.json { render json: @event }
		end
	end

	# GET /events/1/edit
	def edit
	@event = Event.find(params[:id])
	@restaurants = Restaurant.all
	@experiences = Experience.all
	end

	# POST /events
	# POST /events.json
	def create
	@event = Event.new(params[:event])
	@restaurants = Restaurant.all
	@experiences = Experience.all

	@event.status = "open"
	@event.user_id = current_user.id

	invitee_emails = params[:event][:invitees].split(",")

	@event.city = params[:city]

	respond_to do |format|
	  if @event.save

	    if invitee_emails.empty?
	    else
	      InviteMailer.invite(invitee_emails, current_user.name, @event).deliver  
	    end
	    
	    Notifications.event_created(current_user.email, @event, Restaurant.find(@event.restaurant_id)).deliver
	    Notifications.admin_private_event_created(@event, Restaurant.find(@event.restaurant_id)).deliver

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


	def send_notification
		@event = Event.find(params[:event_id])
		attendees = @event.attendee.all
		
		users_to_find = []
		
		attendees.each do |attendee|
			users_to_find << attendee.user_id
		end
		users = User.find(users_to_find)

		result = Notifications.attendee_event_coming_up(users,@event).deliver

		@event.reminder = "sent"

		respond_to do |format|
			if @event.save
				format.json { head :no_content }
			else
				format.json { render json: @event.errors, status: :unprocessable_entity }
			end
		end
	end

end
