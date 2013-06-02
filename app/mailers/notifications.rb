class Notifications < ActionMailer::Base
  default :from => "LetsDine <notifications@letsdine.co>"
	
	def event_join(email_address, event, restaurant)
		@event = event
		@restaurant = restaurant

		email_subject = "Joined #{@event.event_name}"
		
		mail(:to => email_address, :subject => email_subject)	
	end

	def event_created(email_address,event,restaurant)
		@event = event
		@restaurant = Restaurant.find(@event.restaurant_id)

		email_subject = "Created #{@event.event_name}"
		
		mail(:to => email_address, :subject => email_subject)	
	end

	def attendee_event_coming_up(users, event)
		@event = event
		@restaurant = Restaurant.find(@event.restaurant_id)

		users.each do |user|
			logger.debug "It is getting into the user component: #{user.inspect}"
			@user = user
			email_subject = "Reminder: " + @event.event_name + " is coming up!"
			logger.debug "The email address is as follows: #{@user.email}"
			mail(:to => @user.email, :subject => email_subject)	
		end
	end
end
