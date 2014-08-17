class UsersController < ApplicationController

  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:name, :email, :password, :password_confirmation))
    if @user.save
      u = User.where(email: params[:user][:email]).first
      session[:user_id] = u.id.to_s
      # Tell the UserMailer to send email linking to edit password page
      UserMailer.forgot_password(@user).deliver
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params.require(:user).permit(:password, :password_confirmation))
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def show
  end

end
