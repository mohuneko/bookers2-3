class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :corrent_user, only: [:edit, :update]

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

  def corrent_user
  @user = User.find(params[:id])
  if @user != current_user
    redirect_to user_path(current_user)
  end
end

 def create
  @user =User.new(user_params)
  @user.save
  flash[:notice] = "Welcome! You have signed up successfully."
end

 private
 def user_params
  params.require(:user).permit(:name, :profile_image, :introduction)
end
end
