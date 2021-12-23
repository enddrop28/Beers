class User::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, {only: [:show, :edit]}
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @post = Post.new
  end

  def index
    @users = User.all
    @post = Post.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end
  
  def unsubscribe
    @user = current_user
  end

  def out
    @user = current_user
    if @user.update(is_deleted: true)
       #URLを踏ませずにコントローラーから直接サインアウトの指示を出す
       sign_out current_user
    end
       redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
  
end
