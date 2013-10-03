class WelcomeMailer < ActionMailer::Base
  	default :from => "LetsDine <notifications@letsdine.co>"

	def welcome(email_address, name)
		email_subject = "Welcome to LetsDine!"
		@name = name
		#mail(:to => email_address, :subject => email_subject)	

		mail   to:      email_address, # normal mailer stuff
		         subject: email_subject

		headers['X-MC-Tags'] = "signups"
		# Setting the headers for Mandrill tracking
		#headers['X-MC-Track'] = "opens, clicks_htmlonly"
	end

	def autoresponder(email_address, name,time_to_send)
		email_subject = "LetsDine - Need help?"
		from = "prashant@letsdine.co"
		@name = name
		#mail(:to => email_address, :subject => email_subject)	

		mail   to:      email_address, # normal mailer stuff
		         subject: email_subject,
		         :from => from

		mergeVars = 
	    { 
	        "NAME"             => name
	    }
	    headers['X-MC-MergeVars'] = mergeVars.to_json

		headers['X-MC-Template'] = "need-help-autoresponder"
		headers['X-MC-Track'] = "opens"
		headers['X-MC-SendAt'] = "#{time_to_send}"

	end

end
