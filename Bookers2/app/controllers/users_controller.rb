class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images.page(params[:page]).reverse_order
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
    redirect_to user_path(@user.id)
  end

 private user_params
  params.require(:user).permit(:name, :profile_image)

end
