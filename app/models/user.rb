class User < ApplicationRecord
  # 名前は30文字以下
  # メールは255文字以下
  # user@example.comのようなパターンでないと保存されないフォーマットを指定する
  # メールアドレスはユニークなものでなければならないため
  # :uniqueオプションを使用したいが、DBレベルの制約が必要なので
  # emailカラムにインデックスを追加する。インデックス番号ならDBにユニーク
  # な値しか保持しない。インデックスの追加にはマイグレーションファイルの作成が必要だ
  # emailアドレスを保存前に小文字に変換するバリデーションを追加
  # downcase!は破壊的メソッド。小文字変改された際に変数emailの値を
  # 更新するためバリデーションすることができる。
  # has_secure_passwordメソッドでパスワードのハッシュ化をする。
  # そのためにはbcryptが必要なのでgemファイルに記述する
  # パスワードが空でないことかつ、６文字以上の入力を欲求する。
  # password,password_confirmationカラムが増える
  #
  #セキュアパスワード導入
  #パスワードをハッシュ化する
  #bcryptをインストール
  #パスワードに最小文字の制限をかける
  #
  #
  #
  #

  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
            format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation{email.downcase!}
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  has_many :words

  has_many :favorites, dependent: :destroy
  # 任意のUserインスタンスのidとFavoritesテーブルのあるuser_idの数字が
  # 一致しているもの全てを取り出す。
  has_many :favorite_words, through: :favorites, source: :word
end
