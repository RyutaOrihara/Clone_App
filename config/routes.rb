Rails.application.routes.draw do
  # confirmルーティングを追加する
  # collection do はidなどを必要としない固有のルーティングを生成する
  # member doを使うと、idを必要とする固有のルーティングを生成
  # resources :モデル名sとすると、show,edit,update,destroyなどでidが必要なパスを生成
  # resource :モデル名とすると、どのパスにもidが必要ないルーティングを生成
  root 'tops#index'
  resources :words do
    # do はブロックなのでendを忘れずに
    collection do
      # DBに値を入力するための確認画面なのでHTTPメソッドはPOSTである
      # HTTPメソッドがPOSTでアクション名がconfirmというアクションを実行するルーティングの追加
      post :confirm
    end
  end
end
