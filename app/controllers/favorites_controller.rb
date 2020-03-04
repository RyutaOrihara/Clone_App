class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(word_id: params[:word_id])
    redirect_to words_path, notice: "#{favorite.word.user.name}さんの投稿をお気に入り登録しました"
  end
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to words_path, notice: "#{favorite.word.user.name}さんの投稿をお気に入り解除しました"
  end
end
# createアクション（お気に入り登録）では、ビューからパラメータで送られてきたブログのid（params[:blog_id]）を使って、Favoriteのデータを作成・保存しています。
# また、destroyアクション（お気に入り解除）では、同じくビューからパラメータで送られてきたfavoriteのidで、Favoriteのデータを削除しています。

# favorite.blog.user.name
# とかくことで、自分がお気に入り登録したブログの投稿者の名前が抽出できます。
# 同じ理屈で
# favorite.user.name
# とすると、お気に入り登録したユーザーの名前が抽出できます。
