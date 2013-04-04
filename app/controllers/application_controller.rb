class ApplicationController < ActionController::Base
	protect_from_forgery
	after_filter :store_location

	def store_location
		logger.debug "The params data is: #{params.inspect}"
		# store last url as long as it isn't a /users path
		session[:previous_url] = request.fullpath unless request.fullpath =~ /\/users/
	end

	def after_sign_in_path_for(resource)
		if session[:attendee]
			#logger.debug "It is getting to the session attendee thing"
			@attendee = Attendee.new
			attendee_param = session[:attendee]
			session.delete :attendee
			logger.debug "The sessions attendeee param is:#{session[:attendee]}"
			logger.debug "The seats are session[:attendee]"
			logger.debug "the attendee param is: #{attendee_param}"
			@attendee.seats = attendee_param[:attendee][:seats]
			@attendee.event_id = attendee_param[:attendee][:event_id]
			@attendee.phone_number = attendee_param[:attendee][:phone_number]
			@attendee.user_id = current_user.id

			@event = Event.find(attendee_param[:attendee][:event_id])
			
				if @attendee.save! 
					session[:previous_url] = event_path(@event)
					session[:previous_url] || root_path				
				else
					@event = Event.find(@event.id)
	    			@restaurant = Restaurant.find(@event.restaurant_id)
	    			@menu_items = @restaurant.menu_items
	    			@menu_items_categorized = @menu_items.group_by { |menu_item| menu_item.course_name}

	    			logger.debug "the attendee errors are: #{@attendee.errors.inspect}"
	    			session[:attendee_errors] = @attendee.errors
	    			logger.debug "the attendee session errors are: #{session[:attendee_errors].inspect}"

					session[:previous_url] = event_path(@event)
					session[:previous_url] || root_path				
				end
			
		else
			super
		end
		
	end

	def after_update_path_for(resource)
	  session[:previous_url] || root_path
	end

	def after_sign_out_path_for(resource)
	  session[:previous_url] || root_path
	end
end
