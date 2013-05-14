class HomeController < ApplicationController
  def index
    if session[:city].nil?
      if params[:city]
        @user_city = params[:city]
        session[:city] = params[:city]
      else
        @user_city = request.location.city
        session[:city] = request.location.city
      end
    elsif params[:city]
      @user_city = params[:city]
      session[:city] = params[:city]
    elsif session[:city]
      @user_city = session[:city]
    end
    
  	@no_events_in_city = false  			
  	@home_page = true

  	# Getting the last 6 event records 
  	if @user_city.nil?
  	else
      @events = Event.limit(8)
      @events = @events.where('event_type != ?', 'private')
      @events = @events.where('status != ?', 'closed')
  		#@events = Event.find(:all, :conditions => ["event_type != 'private' AND status != 'closed'"], :limit => 8 )
      # Taken from http://stackoverflow.com/questions/9970300/how-to-chain-where-query-in-rails-3-active-record
      @events = @events.where('city = ?', session[:city])
  	end
  	if @events.nil?
		@no_events_in_city = true  			
		@events = Event.find(:all, :conditions => ["event_type != 'private' AND status != 'closed'"], :limit => 8 )
	end
  	
  	#@events = Event.last(8).reverse

  	logger.debug "The events are: #{@events.inspect}"

  	# Getting the last four events for the slider
  	if @user_city.nil?
  	else
  		@header_events = @events.last(4)
  	end

  	if @header_events.nil?
		@no_events_in_city = true  			
		@header_events = @events.last(4)
  	end
  end
end
