class SessionsController < Devise::SessionsController
  respond_to :json

  prepend_before_filter :require_no_authentication, :only => [:create, :destroy, :failure]

  def create
    logger.debug "It is getting here"
    resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    warden.custom_failure!
    render :status => 200,
           :json => { :success => true,
                      :info => "Logged in",
                      :user => current_user
           }
  end

  def destroy
    warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    sign_out
    render :status => 200,
           :json => { :success => true,
                      :info => "Logged out",
           }
  end

  def failure
    logger.debug "Amd the failure section!@!@!@!@!"
    render :status => 401,
           :json => { :success => false,
                      :info => "Login Credentials Failed",
                      :GRR => "Work!!!!",
                      :resource_name => resource_name
           }
  end

  def show_current_user
    warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    render :status => 200,
           :json => { :success => true,
                      :info => "Current User",
                      :user => current_user
           }

  end
end