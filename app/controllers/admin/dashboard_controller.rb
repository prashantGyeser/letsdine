class Admin::DashboardController < Admin::ApplicationController
	def index

	    @event_list = Event.find(:all, :conditions => ["status != ?", "closed"], :order => "event_type")
	    @event_list = @event_list.group_by(&:city)

	    @total_attendees_to_date = 0

	    #@total_signups = User.all.count
	    #@user_ids = User.pluck(:id)
	    #Attendee.where(:user_id => @user_ids).count

	    @total_attendees = Attendee.all.count

		respond_to do |format|
	    	format.html # index.html.erb
	    	format.json { render json: @dashboard }
	    end
	end


end
