class HomeController < ApplicationController
  def index
    if session[:city].nil?
      if params[:city]
        @user_city = params[:city]
        session[:city] = params[:city]
      else
        
        if request.location.city.nil?
          
        else
          @user_city = request.location.city  
          session[:city] = request.location.city
        end
        
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

  	# Getting the last 6 event records 
  	if @user_city.nil?
      logger.debug "It is getting to the user city part"
  	else
      # Taken from http://stackoverflow.com/questions/9970300/how-to-chain-where-query-in-rails-3-active-record
      @events = Event.includes(:restaurant).includes(:attendee => :user).where('event_type != ?', 'private').where('status != ?', 'closed').where('city = ?', session[:city]).limit(12)

  	end

  	if @events.empty?
		  @no_events_in_city = true  			
    end
  	
  end
end
