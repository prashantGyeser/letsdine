class HomeController < ApplicationController
  def index
  	@home_page = true

  	# Getting the last 5 event records 
  	@events = Event.find(:all, :limit => 6).reverse
  	@header_events = Event.find(:all, :limit => 6).reverse
  end
end
