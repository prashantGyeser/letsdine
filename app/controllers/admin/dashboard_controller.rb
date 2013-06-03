class Admin::DashboardController < Admin::ApplicationController
	def index

		@users = User.find(:all, :order => "id")
	    @events = Event.find(:all, :conditions => ["status != ?", "closed"], :order => "event_type")
	    @attendees = Attendee.all

	    @total_attendees_to_date = 0

		respond_to do |format|
	    	format.html # index.html.erb
	    	format.json { render json: @dashboard }
	    end
	end


end
