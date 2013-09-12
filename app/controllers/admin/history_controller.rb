class Admin::HistoryController < Admin::ApplicationController
  def index
	@events = Event.all
	@event_months = @events.group_by { |e| e.event_date.beginning_of_month }
	#@popular_events = Event.find(:all).map{|e| e.total_attendees}.sort
	#popular_events_unsorted = Event.find(:all).sort{|e| e.total_attendees}
	#@popular_events = popular_events_unsorted.order()
	#@popular_events = Event.find(:all).map{|e| e.total = e.total_attendees}
	@popular_events = @events.map{|e| 
	  {:id => e.id, :event_name => e.event_name, :total_attendees => e.total_attendees, :city => e.city }
	}
	@popular_events = @popular_events.sort_by{|e| -e[:total_attendees]}
	#@popular_events = Event.all.map { |item| [ item.total_attendees, item.event_name, item.city] }
	#@popular_events = @popular_events.order()
	logger.debug "the values in tghe pop evebnt thingy is: #{@popular_events.inspect}"
  end
end

