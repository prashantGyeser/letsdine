class HomeController < ApplicationController
  #respond_to :json

  def index
    #respond_with Event.where(:event_type => 'popular')

    @popular_events = Event.where(:event_type => 'popular')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @popular_events }
    end
  end

end
