class DashboardsController < ApplicationController
  # GET /dashboards
  # GET /dashboards.json
  def index
    @users = User.find(:all, :order => "id")
    @events = Event.all
    @attendees = Attendee.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dashboards }
    end
  end
  
end
