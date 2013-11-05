class HomeController < ApplicationController
  respond_to :json

  def index
    respond_with Event.where(:event_type => 'popular')
  end

end
