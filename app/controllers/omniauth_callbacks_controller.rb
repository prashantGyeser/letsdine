class OmniauthCallbacksController < Devise::OmniauthCallbacksController
	def all
		user = User.from_omniauth(env["omniauth.auth"])
		session[:user_id] = user.id
		# redirect_to root_url notice: "Signed in!"
		sign_in_and_redirect user, notice: "Signed in!"
	end
	alias_method :facebook, :all
end
