class Api::EventsController < ApplicationController
  respond_to :json

  before_filter :authenticate_user!, :except => [:show, :index]

  def index
    @events = Event.where('event_type != ?', 'private').where('status != ?', 'closed').where('event_image IS NOT NULL').first(6)
    render json: @events
  end

  def show
    @event = Event.find(params[:id])
    render json: @event
  end

  def create
    @event = Event.new(params[:event])
    logger.debug "The event before adding the user id is: #{@event.inspect}"
    @event.user_id = current_user.id
    logger.debug "The event after adding the user id is: #{@event.inspect}"


    if @event.save
      logger.debug @event.inspect
      logger.debug "The event after saving is: #{@event.inspect}"
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end

  end

end
