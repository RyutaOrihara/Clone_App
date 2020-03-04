Rails.application.routes.draw do
  resources :contacts
  # confirmルーティングを追加する
  # collection do はidなどを必要としない固有のルーティングを生成する
  # member doを使うと、idを必要とする固有のルーティングを生成
  # resources :モデル名sとすると、show,edit,update,destroyなどでidが必要なパスを生成
  # resource :モデル名とすると、どのパスにもidが必要ないルーティングを生成
  root 'tops#index'
# usersコントローラへのルーティング
  # only:[アクション]の記述は理解した
  resources :users, only:[:new,:create,:show]
# sessionsコントローラへのルーティング
  # サーバとのセッションに必要なアクションは作成と保存と削除となる
  resources :sessions, only:[:new,:create,:destroy]
# wordsコントローラへのルーティング
  resources :favorites, only:[:create,:destroy]
  resources :words do
    # do はブロックなのでendを忘れずに
    collection do
      # DBに値を入力するための確認画面なのでHTTPメソッドはPOSTである
      # HTTPメソッドがPOSTでアクション名がconfirmというアクションを
      # 実行するルーティングの追加
      post :confirm
    end
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
