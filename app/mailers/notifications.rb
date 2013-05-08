class Notifications < ActionMailer::Base
  default :from => "LetsDine <notifications@letsdine.co>"
	
	def event_join(email_address, event, restaurant)
		@event = event
		@restaurant = restaurant

		email_subject = "Joined #{@event.event_name}"
		
		mail(:to => email_address, :subject => email_subject)	
	end



end
