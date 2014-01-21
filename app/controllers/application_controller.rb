class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected
 
   def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:phone,:address,:city,:state,:zipcode, :image_url, :url, :description, :name, :avatar, :avatar_file_name, :avatar_content_type, :avatar_file_size, :avatar_updated_at]
    # devise_parameter_sanitizer.for(:account_update) << [:zipcode, :phone_number]
   end

  # def devise_parameter_sanitizer
  #   if resource_class == User
  #     User::ParameterSanitizer.new(User, :user, params)
  #   else
  #     super
  #   end
  # end
end
