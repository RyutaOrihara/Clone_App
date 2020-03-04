class RenameBlogIdColumnToFavorites < ActiveRecord::Migration[5.2]
  def change
    rename_column :favorites, :blog_id, :word_id
  end
end
