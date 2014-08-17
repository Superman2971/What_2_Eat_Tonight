class UserMailer < ActionMailer::Base
  default from: "whattoeattonight@gmail.com"

  def forgot_password(user)
    @user = user
    @url = 'http://w2et.herokuapp.com/users/edit/' + @user.id.to_s
    mail(to: @user.email, subject: 'Welcome to W2ET, don\'t forget your fucking password')
  end

  def email_location(current_user)
    @current_user = current_user
    mail(to: @current_user.email, subject: 'W2ET - Location of some Fucking Food')
  end
end