class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    posts_path
  end

  def after_sign_up_path_for(resource)
    posts_path
  end

  def after_sign_up_path_for(resource)
    root_path
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password,
      :password_confirmation, :avatar, :avatar_cache, :remove_avatar) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password,
      :password_confirmation, :current_password, :avatar, :avatar_cache, :remove_avatar, :cover, :cover_cache, :remove_cover) }
  end
end
