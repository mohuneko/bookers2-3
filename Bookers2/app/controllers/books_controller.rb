class BooksController < ApplicationController


  def show
  end

  def index
   @books = Book.all #記事を全件取得
  end

  def new
   @book = Book.new #投稿フォーム
  end

  def create
   book = Book.new(book_params) #表示された投稿を保存
   book.save
   redirect_to books_path
  end

  def edit
  end

private
 def book_params
  params.require(:book).permit(:title, :opinion)
end
end
