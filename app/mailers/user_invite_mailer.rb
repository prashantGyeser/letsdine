class UserInviteMailer < ActionMailer::Base
	default :from => "LetsDine <notifications@letsdine.co>"
	def invite(email_addresses, sender_name, event)
		@event = event
		@sender = sender_name

		email_addresses.each do |email|
			email_subject = @sender + " sent you an invite to join " + @event.event_name
			mail(:to => email, :subject => email_subject)	
		end
	end
end
