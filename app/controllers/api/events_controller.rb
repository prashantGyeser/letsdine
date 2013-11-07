class Admin::ApplicationController < ApplicationController
  respond_to :json

  before_filter :authenticate_user!, :except => [:show, :index]

  def index
    respond_with Event.all
  end

end
