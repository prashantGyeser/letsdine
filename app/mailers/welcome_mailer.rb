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

	def autoresponder(email_address, name)
		#email_subject = "Welcome to LetsDine!"
		@name = name
		#mail(:to => email_address, :subject => email_subject)	

		mail   to:      email_address # normal mailer stuff
		         #subject: email_subject

		headers['X-MC-Template'] = "need-help-autoresponder"
		headers['X-MC-MergeVars'] = "{'FNAME': "#{name}"}"
		headers['X-MC-SendAt'] = (Time.now.utc) + (3*60)

	end

end
