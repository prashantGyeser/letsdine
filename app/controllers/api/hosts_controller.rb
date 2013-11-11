class Api::HostsController < ApplicationController
  respond_to :json

  before_filter :authenticate_user!

  def events
    logger.debug "Woohoo! Finally a log message"
    @events = Event.all.first(6)
    render json: @events
  end

  def index
    @events = Event.where(:user_id => params[:id])
    render json: @events
  end

  def show
    @event = Event.find(params[:id])
    render json: @event
  end

  def create
    logger.debug "WooHoo! It is getting to the create: #{params}"

    render json: "Rails controller to angular app. I am here in the create action"
  end

end
