class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]

  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets.reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def following
    user = User.find(params[:id])
    @users = user.following
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :email, :profile_image)
  end
end
