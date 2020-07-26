class ApplicationController < ActionController::Base
  # deviseコントローラーにストロングパラメータを追加する     
  before_action :configure_permitted_parameters, if: :devise_controller?
  # ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!


  def after_sign_in_path_for(resource)
    root_path # ログイン後に遷移するpathを設定
  end

  def after_sign_out_path_for(resource)
    new_user_session_path # ログアウト後に遷移するpathを設定
  end

  protected

    def configure_permitted_parameters
      # サインアップ時にnameのストロングパラメータを追加
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      # アカウント編集の時にnameのストロングパラメータを追加
      devise_parameter_sanitizer.permit(:account_update, keys: [:name,:icon])
    end
end
