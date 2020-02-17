class UsersController < ApplicationController
# マイ/ユーザーページ関連
  def index # 1 一覧
  end

  def show
  	@user = User.find(params[:id])# Userテーブルからuser_idを取得
  	@books = @user.book.find(params[:id])# user_idと紐づいた投稿記事を取得
  end

  def edit # 4 編集
  	@user = User.find(params[:id])# 編集用Viewでform_forを使う準備
  end

  def update # 6 更新
  	@user = User.find(params[:id])# Userテーブルからuser_idを取得
    @user.update(user_params)# カラムを取得し更新する
    redirect_to user_path(@user.id)# ユーザーの詳細画面へリダイレクト
  end

  private
  	def book_params
  		params.require(:user).permit(:name, :profile_image_id, :introduction)
  	end
end
