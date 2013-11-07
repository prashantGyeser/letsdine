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

end
