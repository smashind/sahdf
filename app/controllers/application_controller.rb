class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, :alert => exception.message
  end

  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) << :name << :remote_image_url
    devise_parameter_sanitizer.for(:account_update) << :name << :image << :image_cache << :remove_image
  end

  def after_sign_in_path_for(resource)
  	user_path(current_user)
	end

end
