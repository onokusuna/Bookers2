class BooksController < ApplicationController
# 投稿books関連
before_action :authenticate_user!, except: [:top]# ログイン済ユーザーのみにアクセスを許可する
# 編集画面にアクセスする際にURLに指定されるユーザーのIDが、現在ログインしているユーザーのIDと一致しているかのチェックを行うメソッド
  before_action :correct_user,   only: [:edit, :update ]# 直打ち防止
	def top # root
	end

	def index # 1 一覧
		@books = Book.all # Bookテーブルに入っている全データを取得
		@book = Book.new
		@user = current_user
	end

	def show # 2 詳細
		@books = Book.find(params[:id])# Userテーブルからuseridを取得
  		@user = @books.user# user_idと紐づいた投稿記事を取得
  		@book = Book.new
	end

	def edit # 4 編集
		@books = Book.find(params[:id])
		@user = @books.user
	end

	def create # 5 保存 Strong Parametersも必要なので、同時に定義
		@book = Book.new(book_params)# 現在のuserが投稿すると初期値の投稿が作られ、その中に引数（投稿した内容）が反映されたものを@bookと定義
		@book.user_id = current_user.id
		if @book.save
		   flash[:notice] = 'You were successfully.'# notice=通知
		   redirect_to book_path(@book.id)
		else
      	   @books = Book.all# renderが全記事情報を取得してindexに飛ぶために@をつける
      	   @user = current_user
      	   render :index# render=(…に)する、与える
      	end
	end

	def update # 6 更新
		@books = Book.find(params[:id])# Bookテーブルからidを参照して見つけたものを@bookと定義
		if @books.update(book_params)
		   flash[:notice] = 'You were successfully.'# notice=通知
		   redirect_to book_path(@books)
		else
			@book = Book.new
       		render 'edit'# リダイレクトにしない理由はエラーメッセージが消えてしまうため
       	end
	end

	def destroy # 7 削除
		@books = Book.find(params[:id])
		if @books.destroy
		   flash[:notice] = 'You were successfully.'
		   redirect_to books_path# books#index
		else
			render :index
		end
	end

	private
	def book_params
		params.require(:book).permit(:title, :body, :user_id)
	end

    def correct_user
      @books = Book.find(params[:id])
      @user = @books.user# bookテーブルの中のuser_id
      redirect_to books_path unless @user == current_user# book_idに紐づいているuser_idと現在のuser_idが一致している
    end
    
    def redirect_root
      redirect_to root_path unless user_signed_in?
    end
end
