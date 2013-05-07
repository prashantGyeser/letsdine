ActionMailer::Base.smtp_settings = {
	:address   => "smtp.mandrillapp.com",
	:port      => 587,
	:enable_starttls_auto => true, # detects and uses STARTTLS
	#:user_name => ENV["MANDRILL_USERNAME"],
	#:password  => ENV["MANDRILL_API_KEY"],
	:user_name => "app14258460@heroku.com",
	:password  => "BP25zW_ElD7ae-6H_lsHCA",
	:authentication => 'login', # Mandrill supports 'plain' or 'login'
	:domain => 'letsdine.co' # your domain to identify your server when connecting
}
ActionMailer::Base.delivery_method = :smtp
#ActionMailer::Base.default_url_options[:host] = "letsdine.co"