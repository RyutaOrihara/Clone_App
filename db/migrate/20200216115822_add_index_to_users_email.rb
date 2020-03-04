class AddIndexToUsersEmail < ActiveRecord::Migration[5.2]
# usersテーブルのemailカラムにunique制約を追加
# インデックス自体は一意性を強制しないが、オプションでunique:true
# を指定することで強制できるようになる。
  def change
    add_index :users, :email, unique: true
  end
end
