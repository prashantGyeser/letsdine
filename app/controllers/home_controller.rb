class HomeController < ApplicationController
  before_filter do
    headers['Cache-Control'] = 'public; max-age=86400'
  end
  def index
    logger.debug "the value in the city params is: #{params[:city]}"
    if session[:city].nil?
      if params[:city]
        @user_city = params[:city]
        session[:city] = params[:city]
      else
        
        if request.location.nil?
          
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
      
  	else
      # Taken from http://stackoverflow.com/questions/9970300/how-to-chain-where-query-in-rails-3-active-record
      @events = Event.includes(:restaurant).includes(:attendee => :user).where('event_type != ?', 'private').where('status != ?', 'closed').where('city = ?', session[:city]).order('event_date ASC')

  	end

  	if @events.empty?
		  @no_events_in_city = true  			
    end
  
  end
end
