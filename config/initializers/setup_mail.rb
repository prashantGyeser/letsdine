ActionMailer::Base.smtp_settings = {
	:address				=> "smtp.gmail.com",
	:port					=> 587,
	:domain					=> "gyeser.com",
	:user_name				=> "notifications@gyeser.com",
	:password				=> "password@123",
	:authentication			=> "plain",
	:enable_starttls_auto	=> true
}
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default_url_options[:host] = "localhost:3000"