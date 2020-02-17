class BooksController < ApplicationController
	def top # root
	end

	def index # 1 一覧
		@book = Book.all # Bookテーブルに入っている全データを取得
		@book = user_id.book_id(book_params).new
	end

	def show # 2 詳細
	end

	def edit # 4 編集
	end

	def create # 5 保存 Strong Parametersも必要なので、同時に定義
		@book = user_id.book_id(book_params).new
		@book.save
		redirect to book_path(@book)
	end

	def update # 6 更新
	end

	def destroy # 7 削除
	end

	private
		def book_params
			params.require(:book).permit(:title, :body)
		end

end
