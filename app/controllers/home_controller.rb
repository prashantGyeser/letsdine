class HomeController < ApplicationController
  def index
  	@home_page = true

  	# Getting the last 6 event records 
  	@events = Event.last(6)
  	# Getting the last four events for the slider
  	@header_events = Event.last(4)
  end
end
