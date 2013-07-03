class Admin::InvitesController < Admin::ApplicationController
  def index
  	@invites = UserInvite.all
  	@new_city_added_notifications = NewCityNotification.all
  end
end
