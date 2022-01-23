class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: session_params[:name])#取得したユーザー名でユーザーを検索

      if user&.authenticate(session_params[:password])#ユーザーが見つかった場合には、送られてきたパスワードによる認証をauthenticateメソッドで行う
      session[:user_id]=user.id#認証に成功した場合に、セッションにuser_idを格納しています。

      redirect_to root_path, notice: 'ログインしました'

    else
      render :new
    end
  end
end
