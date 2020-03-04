class ApplicationController < ActionController::Base
  # Railsの全コントローラでセッション用のヘルパーモジュールを使えるように
  # インクルードする
  protect_from_forgery with: :exception
  include SessionsHelper
end
