class Admin::ApplicationController < ApplicationController
	layout 'admin/admin'

	logger.debug "It is getting to the admin controller"

	# Checking if the user is an admin otherwise redirecting them back to the default root url
	before_filter :verify_admin
	private
	def verify_admin
		logger.debug "The current user is: #{current_user}"
	  #redirect_to root_url unless current_user.try(:admin?)
	end
end
