class SessionsController < ApplicationController
  def new
    #present an empty login form
    @user = User.new
  end

  def create
    #Find the user that is trying to login
    u = User.where(email: params[:user][:email]).first
    #prove that they are indeed who they say they are (password)
    if u && u.authenticate(params[:user][:password])
      #store as a cookie in browser, their id
      #indicating that they are logged in
      session[:user_id] = u.id.to_s
      redirect_to root_path
    else
      #go back to the login page
      redirect_to new_session_path
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  def forgot
    @user = User.new
  end
end