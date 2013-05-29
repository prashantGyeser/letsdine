class AllEventController < ApplicationController
  def index
  	@events = Event.limit(1000)
  end
end
