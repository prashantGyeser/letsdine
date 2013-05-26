class HomeController < ApplicationController
  def index
    logger.debug "The params is:{params.inspect}"
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
    @new_city_notification = NewCityNotification.new
    @events = []
    @header_events = []

  	# Getting the last 6 event records 
  	if @user_city.nil?
      logger.debug "It is getting to the user city part"
  	else
      @events = Event.limit(12)
      @events = @events.where('event_type != ?', 'private')
      @events = @events.where('status != ?', 'closed')
  		#@events = Event.find(:all, :conditions => ["event_type != 'private' AND status != 'closed'"], :limit => 8 )
      # Taken from http://stackoverflow.com/questions/9970300/how-to-chain-where-query-in-rails-3-active-record
      @events = @events.where('city = ?', session[:city])
  	end

    logger.debug "The event nil check is:#{@events.nil?}"
    logger.debug "The event empty check is:#{@events.empty?}"

  	if @events.empty?
      logger.debug "It is getting to the no events in city part"
		@no_events_in_city = true  			
	end
  	
  end
end
