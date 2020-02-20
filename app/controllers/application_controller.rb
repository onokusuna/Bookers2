class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters# nameを自由にアプリケーション側でいじれるようにストロングパロメータを追加します。
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
 end
# ログイン後のリダイレクト先
  def after_sign_in_path_for(resource)
  	user_path(resource)
  end
# ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource)
  	root_path
  end
end
