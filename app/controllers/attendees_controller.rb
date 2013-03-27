class AttendeesController < ApplicationController
	before_filter :authenticate_user!
	def create
		@attendee = Attendee.new
		logger.debug "the params in the attendee controller is: #{params.inspect}"
		@attendee.seats = params[:attendee][:seats]
		@attendee.event_id = params[:attendee][:event_id]
		@attendee.user_id = current_user.id

		@event = Event.find(params[:attendee][:event_id])

		respond_to do |format|
			if @attendee.save 
				format.html { redirect_to event_path(@event), notice: 'You have successfully joined the event'}
				format.json { render json: @event, status: :created, location: @event }
			else
				format.html { render action: "show" }
	      		format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
		

		
	end
end
