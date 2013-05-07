class AttendeesController < ApplicationController
	#before_filter :authenticate_user!
	def create
		if current_user.nil?
			session[:attendee]	= params
			redirect_to new_user_session_path
		else
			@attendee = Attendee.new
			@attendee.seats = params[:attendee][:seats]
			@attendee.event_id = params[:attendee][:event_id]
			@attendee.phone_number = params[:attendee][:phone_number]
			@attendee.user_id = current_user.id

			@event = Event.find(params[:attendee][:event_id])

			respond_to do |format|
				if @attendee.save 
					Notifications.event_join(current_user.email, @event, Restaurant.find(@event.restaurant_id)).deliver
					session[:joined] = true
					format.html { redirect_to event_path(@event), notice: 'You have successfully joined the event'}
					format.json { render json: @event, status: :created, location: @event }
				else
					@event = Event.find(@event.id)
	    			@restaurant = Restaurant.find(@event.restaurant_id)
	    			@menu_items = @restaurant.menu_items
	    			@menu_items_categorized = @menu_items.group_by { |menu_item| menu_item.course_name}

	    			session[:attendee_errors] = @attendee.errors

					format.html { redirect_to event_path(@event)}
		      		format.json { render json: @attendee.errors, status: :unprocessable_entity }
				end
			end
		end		
	end
end
