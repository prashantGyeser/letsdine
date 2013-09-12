class Admin::HistoryController < Admin::ApplicationController
  def index
	@events = Event.all
	@event_months = @events.group_by { |e| e.event_date.beginning_of_month }
	#@popular_events = Event.find(:all).map{|e| e.total_attendees}.sort
	#popular_events_unsorted = Event.find(:all).sort{|e| e.total_attendees}
	#@popular_events = popular_events_unsorted.order()
	@popular_events = Event.find(:all).map{|e| e.total = e.total_attendees}
	logger.debug "the values in tghe pop evebnt thingy is: #{@popular_events.inspect}"
  end
end

