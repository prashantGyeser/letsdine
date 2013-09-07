class Admin::HistoryController < Admin::ApplicationController
  def index
	@events = Event.all
	@event_months = @events.group_by { |e| e.event_date.beginning_of_month }
	
  end
end
