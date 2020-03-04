class UsersController < ApplicationController
# ユーザ新規登録
  def new
    # form_withで登録フォームを作成のためインスタンス変数を用意
    @user = User.new
  end

# ログイン機能も、他の機能同様newからのcreateで実装する。
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id), notice:"ユーザー登録が完了しました"
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @favorites_words = @user.favorite_words
  end

  private

  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
end
