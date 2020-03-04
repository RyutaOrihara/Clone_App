# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
100.times do |n|
  name = Faker::Games::Pokemon.name
  email = Faker::Internet.email
  password = "password"
  User.create!(name: name,
              email: email,
              password: password,
              password_confirmation: password,
              )
end

# email = Faker::Internet.emailとemail: email の生成を100回繰り返す
# passwordはfakerメソッドは使わずに直打ちでpasswordにしている
# name,email,password変数にFakerメソッドを使った値をtimesメソッドの数だけ実行。
# User.create!の”！”については失敗時に例外を発生させるために必要

# 早速本題に入るとsaveやcreateの場合は返り値として
# false/trueのbool値を返します。一方、save!やcreate!（update!）などは、実際に作成したインスタンスを返却します。
# また、ここが大きな違いなのですが！（エクストラメーション）をつけたメソッドはモデルの更新や作成に失敗した場合に例外を発生させます。
