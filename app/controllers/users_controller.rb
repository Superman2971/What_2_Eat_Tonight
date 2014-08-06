class UsersController < ApplicationController
  def index
    @users = User.all
    @users = User.where(is_active: true)
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(params.require(:user).permit(:name, :email, :password, :password_confirmation))
    if user.save
      redirect_to users_path
    else
      redirect_to new_user_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if current.user != @user
      if current_user
        redirect_to user_path(current_user)
      else
        redirect_to new_session_path
      end
    elsif @user.update_attributes(params.require(:user).permit(:name, :email, :is_active))
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.is_active = false
    redirect_to users_path
    @user.save
  end

  def reactivate
    @user = User.find(params[:id])
  end
end
