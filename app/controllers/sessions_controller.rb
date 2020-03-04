class SessionsController < ApplicationController
# ログイン機能用のコントローラ、セッション
 # 新規セッション作成
  def new

  end
 # セッション保存
  # メールアドレスとパスワードに組み合わせが有効かどうか判定する
  # 有効ならログインする、有効でない場合は再入力させる
  def create
    # 送信されたメールアドレスを元にfind_byメソッドでデータベースからユーザを鳥dす。
    # ユーザコントローラのcreateアクションで小文字でDBに保存しているため
    # 同様にdowncaseメソッドを使う
    # おさらい Parametersはハッシュのためシンボルを二回かく
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
       #user は if文を通すために必要
       #ログイン成功した場合
       # sessionメソッドを使って、ログイン後、ユーザ詳細ページにリダイレクトさせる
       session[:user_id] = user.id
       redirect_to user_path(user.id)
     else
       # ログインに失敗した場合
       # フラッシュメッセージを追加してもう一度new画面を描画する
       # new.html.erbにflashメッセージ表示のコードを追加する
       flash.now[:danger] = "ログインに失敗しました"
       render :new
     end
  end
# ログアウト機能
  def destroy
    # セッションメソッドでuser_idを消す
    session.delete(:user_id)
    # ログアウトしたらログインページにダイレクトさせる
    flash[:notice] = "ログアウトしました"
    redirect_to new_session_path
  end
end
