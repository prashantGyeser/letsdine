class Admin::UserController < Admin::ApplicationController
  def index
  	#@user_list = User.find(:all, :group => 'city, id, email, name')
  	@user_list = User.all.group_by(&:city)
  end
end
