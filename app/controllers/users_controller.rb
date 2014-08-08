class UsersController < ApplicationController

  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(params.require(:user).permit(:name, :email, :password, :password_confirmation))
    if user.save
      u = User.where(email: params[:user][:email]).first
      session[:user_id] = u.id.to_s
      redirect_to root_path
    else
      redirect_to new_user_path
    end
  end

end
