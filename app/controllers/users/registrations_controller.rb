class Users::RegistrationsController < Devise::RegistrationsController
  # def new
  #   super
  # end

  def create
  	logger.debug "The params in the user reg controller are: #{param.inspect}"
    super

  end
end
