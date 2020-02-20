class UsersController < ApplicationController
# マイ/ユーザーページ関連
before_action :authenticate_user!# ログイン済ユーザーのみにアクセスを許可する
# 編集画面にアクセスする際にURLに指定されるユーザーのIDが、現在ログインしているユーザーのIDと一致しているかのチェックを行うメソッド
  before_action :correct_user,   only: [:edit, :update ]# 直打ち防止
  def index # 1 一覧
  	@users = User.all
    @user = current_user
    @book = Book.new
  end

  def show
  	@book = Book.new
  	@user = User.find(params[:id])# Userテーブルからuseridを取得
  	@books = @user.books# user_idと紐づいた投稿記事を取得
  end

  def edit # 4 編集
  	@user = User.find(params[:id])# @をつけるのは編集用Viewでform_forを使う準備
  end

  def update # 6 更新
  	@user = User.find(params[:id])# Userテーブルからuser_idを取得
    if @user.update(user_params)# カラムを取得し更新する
       flash[:notice] = 'You were successfully.'# notice=通知
       redirect_to user_path(@user.id)# ユーザーの詳細画面へリダイレクト
    else
       render 'edit'# リダイレクトにしない理由はエラーメッセージが消えてしまうため
    end
  end

  private
  	def user_params
  		params.require(:user).permit(:name, :profile_image_id, :introduction)
  	end

    def correct_user
      @user = User.find(params[:id])
      redirect_to user_path(current_user) unless @user == current_user
    end

    def redirect_root
      redirect_to root_path unless user_signed_in?
    end
end
