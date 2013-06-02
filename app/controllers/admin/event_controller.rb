class Admin::EventController < Admin::ApplicationController
	def index
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

		logger.debug "The result is : #{result}"

		respond_to do |format|
	    	format.json { render json: @event }
	    end
	end

end
