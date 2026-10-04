class UsersController < ApplicationController
  allow_unauthenticated_access only: [:new, :create]
  before_action :is_matching_login_user, only: [:edit, :update]

  def index
    @user  = current_user
    @book  = Book.new
    @users = User.all
  end
  
  def new
    @user = User.new
  end

  def show
    @user  = User.find(params[:id])
    @books = @user.books
    @book  = Book.new
  end

def create
  @user = User.new(user_params)
  if @user.save
    start_new_session_for @user
    redirect_to @user, notice: "Welcome! You have signed up successfully."
  else
    render :new, status: :unprocessable_entity
  end
end

  def edit
    @user = User.find(params[:id])
  end

def update
  @user = User.find(params[:id])
  if @user.update(user_update_params)
    redirect_to user_path(@user), notice: "Profile updated successfully."
  else
    render :edit, status: :unprocessable_entity
  end
end
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image, :password, :password_confirmation, :email_address)
  end

  def user_update_params
    params.require(:user).permit(:name, :introduction, :profile_image, :password, :password_confirmation, :email_address)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user == current_user
      redirect_to user_path(current_user) and return
    end
  end
end

