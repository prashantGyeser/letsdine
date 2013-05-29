class AllEventController < ApplicationController
  def index
  	@events = Event.all
  end
end
