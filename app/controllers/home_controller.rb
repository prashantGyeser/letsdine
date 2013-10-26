class HomeController < ApplicationController
  before_filter do
    headers['Cache-Control'] = 'public; max-age=86400'
  end
  def index
    
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

  def createInterestAndCity

    #@interest = Interest.new
    

    if params[:city].blank?

    else
      logger.debug "The value in the params is: #{params[:user_id]}"
      user = User.find(params[:user_id])
      logger.debug "The user is : #{user.inspect}"
      user.city = params[:city]
      user.save
    end 

    interests = params[:interests]

    splitInterests = interests.split(/,/)

    splitInterests.each do |interest|    
      newInterest = Interest.new
      newInterest.name = interest
      newInterest.user_id = params[:user_id]
      newInterest.save
    end

    respond_to do |format|
        format.html { redirect_to @interest, notice: 'Group was successfully created.' }
        format.json { render json: @interest, status: :created, location: @group }
    end

  end

end
