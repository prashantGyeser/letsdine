class OmniauthCallbacksController < Devise::OmniauthCallbacksController
	def all
		user = User.from_omniauth(env["omniauth.auth"])
		session[:user_id] = user.id
		redirect_to root_url notice: "Signed in!"
	end
	alias_method :facebook, :all
end
