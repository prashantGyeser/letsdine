class ApplicationController < ActionController::Base
  protect_from_forgery

  layout nil

  #config.to_prepare do
    #DeviseController.respond_to :html, :json
  #end

  respond_to :html, :json

end
