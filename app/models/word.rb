class Word < ApplicationRecord
  # DBに値を登録する前に値をチェックする仕組みのこと
  # コロンの位置がいつも悩むので分解して覚える
  # どのカラムにバリデーションを適用するか定義する
  # validates :カラム名,"カラム名の後のカンマ"
  # 次にバリデーションの内容を定義
  # presence: true
  validates :content, presence: true
  validates :content, length: {in: 1..140}
  # contentという値を確認し、ブランクであった場合は違反状態の値とみなして保存を中止します

  belongs_to :user
  has_many :favorites, dependent: :destroy
  # 任意のWordsインスタンスのidとFavoritesテーブルにあるword_idの数字が一致している
  # もの全てを取り出す。
  # 削除されると同時に、お気に入り情報も削除されるようになります。
  has_many :favorite_users, through: :favorites, source: :user
  # through: :favoritesで「favoritesを通過して」
  # source: :userで「userの情報を取得する」という意味合いになります
  # word.favorite_usersで投稿をお気に入りに指定いるユーザ一覧を取得できる


  # Wordモデルのimageカラムに、ImageUploaderを紐付けます。
  mount_uploader :image, ImageUploader
end

# validateは、saveメソッド、createメソッド、updateメソッドなどデータを保存、更新する時に実行されます。
# バリデーションが値を許したら「バリデーション成功」、許されなかったら「バリデーション失敗」となります。

# 様々なバリデーション
# ブランクであること
# validates :login, absence: true

# ユニーク(同じものが2つあってはいけない存在)であること
# validates :user_name, uniqueness: true

# 長さ
# validates :title, length: {minimum:1} 1文字以上
# validates :title, length: {maximum:75} 75文字以上
# validates :title, length: {in: 1..75} 1文字以上,75文字以下
# validates :password, length: {is: 8} 8文字のみ
