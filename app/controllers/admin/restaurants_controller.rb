class Admin::RestaurantsController < Admin::ApplicationController
  def index
  	@restaurants = Restaurant.all
  end
end
