class Admin::EventController < Admin::ApplicationController
	def index
		@event_list = Event.all.group_by(&:city)
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
