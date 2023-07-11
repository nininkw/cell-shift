class ApplicationController < ActionController::Base
  # ログイン済ユーザーのみにアクセスを許可
  before_action :authenticate_user!
  # deviseコントローラーにストロングパラメータを追加する 
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def after_sign_in_path_for(resource)
    if current_user
      flash[:notice] = "ログインに成功しました"
      if current_user.admin?
        admin_root_path
      else
        root_path
      end
    else
      flash[:notice] = "新規登録完了。プロフィールを完成させてください"
      edit_user_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :user
      new_user_session_path
    else
      new_admin_session_path
    end
  end
end
