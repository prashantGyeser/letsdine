class AttendeesController < ApplicationController
	before_filter :authenticate_user!
	def create
		@attendee = Attendee.new

		@attendee.seats = params[:attendee][:seats]
		@attendee.event_id = params[:attendee][:event_id]
		@attendee.user_id = current_user.id

		@event = Event.find(params[:attendee][:event_id])

		respond_to do |format|
			if @attendee.save 
				format.html { redirect_to event_path(@event), notice: 'You have successfully joined the event'}
				format.json { render json: @event, status: :created, location: @event }
			else
				@event = Event.find(@event.id)
    			@restaurant = Restaurant.find(@event.restaurant_id)
    			@attendee = Attendee.new
    			@menu_items = @restaurant.menu_items
    			@menu_items_categorized = @menu_items.group_by { |menu_item| menu_item.course_name}

    			logger.debug "the attendee errors are: #{@attendee.errors.inspect}"
    			session[:attendee_errors] = @attendee.errors
    			logger.debug "the attendee session errors are: #{session[:attendee_errors].inspect}"

				format.html { redirect_to event_path(@event)}
	      		format.json { render json: @attendee.errors, status: :unprocessable_entity }
			end
		end
		

		
	end
end
