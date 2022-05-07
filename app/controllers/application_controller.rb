class ApplicationController < ActionController::Base
  # devise利用の機能（ユーザ登録、ログイン認証など）が使われる前に
  # configure_permitted_parametersメソッドが実行されるようになる。
  before_action :configure_permitted_parameters, if: :devise_controller?

  # サインイン後にどこに遷移するかを設定しているメソッド(Deviseが用意している)
  def after_sign_in_path_for(resource)
    "/users/#{current_user.id}"
  end

  # サインアウト後の遷移先（デフォルトはroot_pathのため今回はコメントアウト）
  # def after_sign_out_path_for(resource)
  #   about_path
  # end

  # privateは記述をしたコントローラ内でしか参照できないが、
  # protectedは呼び出された他のコントローラからも参照することが可能。
  protected

  # ユーザー登録（sign_up)の際に、ユーザー名（name）のデータ操作を許可
  # ストロングパラメータと同様の機能
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  private

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,keys:[:email]) # 注目
    end
end
