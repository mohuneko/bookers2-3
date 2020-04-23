class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :corrent_user, only: [:edit, :update]

  def show
   @bbook = Book.new
   @book = Book.find(params[:id])
   @user = User.find_by(id: @book.user_id)
  end

  def index
   @book = Book.new #投稿フォーム
   @books = Book.all #記事を全件取得
   @user = current_user
   #@books = Book.page(params[:page]).reverse_order
  end

  def new
  end

  def create
    @book = Book.new(book_params) #表示された投稿を保存
    @book.user_id = current_user.id
   if @book.save
    flash[:message]= "successfully"
    redirect_to book_path(@book.id) #book_path(@book.id)だとエラー出るため一旦booksへリダイレクト
   else
    @user = current_user
    @books = Book.all #記事を全件取得
    render action: :index #失敗の場合,なぜかbooksだとエラーになるため一旦edit
  end
end

  def edit
   @book = Book.find(params[:id]) #既存のレコードを取得している。updateで動く
  end

  def destroy
   book = Book.find(params[:id])
   book.destroy #削除
   redirect_to books_path #booksへリダイレクト
 end

 def corrent_user
  @book = Book.find(params[:id])
  if @book.user != current_user
    redirect_to books_path
  end
end
 def update
  @book = Book.find(params[:id])
 if @book.update(book_params)
  flash[:message] = "successfully"
  redirect_to book_path
 else
  render "edit"
 end
end

  private
  def book_params
   params.require(:book).permit(:title, :body, :user_id)
  end
end
