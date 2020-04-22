class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :current_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
    #@book = Booke.page(params[:page]).reverse_order

  end

  def new
  	@user = User.new #新規のユーザーを作成している

  end

  def edit
  	@user = User.find(params[:id]) #既存のユーザを参照している
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
  if @user.save
    flash[:message]= "successfully"
    redirect_to user_path(@user.id)
  else
    render action: :edit
  end
end

  def index
   @users = User.all
   @book = Book.new
   @user = current_user
  end

 private
 def user_params
  params.require(:user).permit(:name, :profile_image, :introduction)
end
end
