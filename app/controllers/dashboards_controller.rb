class DashboardsController < ApplicationController
  # GET /dashboards
  # GET /dashboards.json
  def index
    @users = User.find(:all, :order => "id")
    @events = Event.find(:all, :order => "status").reverse
    @attendees = Attendee.all

    @total_attendees_to_date = 0

    @attendees.each do |attendee|
      if attendee.seats.nil?
        @total_attendees_to_date = @total_attendees_to_date + 1
      else
        @total_attendees_to_date = @total_attendees_to_date + attendee.seats
      end
      
    end
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dashboards }
    end
  end
  
end
