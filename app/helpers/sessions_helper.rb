module SessionsHelper
  # セッションからユーザIDを取得して、それを元にユーザー名を表示してみましょう。
  # まずログイン中のユーザを取得するメソッドをヘルパーメソッドとして定義します。
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  # ||= は @current_userの中身が偽の場合、右辺の値を代入する。
  # すでに中身があれば上書きできない
  # User.find_byとはUserクラスに対して実行しているfind_byは
  # ハッシュからデータを取得している。
  # User.find_by(id: session[:user_id])は
  # sessionメソッドを使っている
  # 実行時にユーザーのブラウザ内のcookiesに暗号化されたユーザーIDが自動で生成されます

  def logged_in?
    #ユーザがログインしていればtrueを返す、その他ならfalse
    current_user.present?
  end
end
