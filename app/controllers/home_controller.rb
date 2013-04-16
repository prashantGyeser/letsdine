class HomeController < ApplicationController
  def index
  	@home_page = true

  	# Getting the last 6 event records 
  	@events = Event.find(:all, :conditions => ["event_type != 'private' AND status != 'closed'"], :limit => 8 )
  	#@events = Event.last(8).reverse

  	logger.debug "The events are: #{@events.inspect}"

  	# Getting the last four events for the slider
  	@header_events = Event.find(:all, :conditions => ["event_type != 'private'"], :limit => 4 )
  end
end
