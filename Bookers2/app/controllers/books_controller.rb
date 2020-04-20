class BooksController < ApplicationController


  def show
  end

  def index

   @book = Book.new #投稿フォーム
   @books = Book.all #記事を全件取得
  end

  def new
  end

  def create
    @book = Book.new(book_params) #表示された投稿を保存
    @book.user_id = current_user.id
   if @book.save
    redirect_to "/books" #book_path(@book.id)だとエラー出るため一旦booksへリダイレクト
   else
    render "edit" #失敗の場合,なぜかbooksだとエラーになるため一旦edit
  end
end

  def edit
   @book = Book.find(params[:id]) #既存のレコードを取得している。updateで動く
  end

  private
  def book_params
   params.require(:book).permit(:title, :opinion, :user_id)
  end
end

 #def  create_params
  #params.require(:book).permit(:title, :opinion
#end

