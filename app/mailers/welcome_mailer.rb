class WelcomeMailer < ActionMailer::Base
	after_action :set_business_headers

  default :from => "LetsDine <notifications@letsdine.co>"
	def welcome(email_address, name)
		email_subject = "Welcome to LetsDine!"
		@name = name
		mail(:to => email_address, :subject => email_subject)	

		# Setting the headers for Mandrill tracking
		#headers['X-MC-Track'] = "opens, clicks_htmlonly"
	end

	private

	def set_business_headers
		headers["X-MC-Tags"] = "signups"
	end

end
