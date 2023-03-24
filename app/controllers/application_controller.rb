class ApplicationController < ActionController::Base
  # before_action :authenticate_user!, :authenticate_admin!

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope == :user
      edit_user_user_path(id: current_user.id)
    else
      edit_user_user_path(id: current_user.id)
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :user
      new_user_session_path
    else
      new_admin_session_path(id: current_admin.id)
    end
  end
end
