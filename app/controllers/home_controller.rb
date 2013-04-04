class HomeController < ApplicationController
  def index
  	@home_page = true

  	# Getting the last 6 event records 
  	@events = Event.last(8).reverse
  	@events.each do |event| 
  		event_description = event.event_description
  		words = event_description.split(" ")
  		description_summary = "" 
  		words.each do |word|
  			description_summary += word if description_summary.size + word.size < 100
  		end

  		description_summary += "..."

  		event.event_description = description_summary
  	end

  	# Getting the last four events for the slider
  	@header_events = Event.last(4)
  end
end
