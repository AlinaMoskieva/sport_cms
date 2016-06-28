class ApplicationController < ActionController::Base
  include Authentication
  include Authorization

  protect_from_forgery with: :exception

  responders :flash
  respond_to :html

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  def authorization_admin
    unless current_user && current_user.role == 'administrator'
      redirect_to root_path
    end
  end
end
