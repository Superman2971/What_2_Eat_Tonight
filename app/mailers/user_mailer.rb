class UserMailer < ActionMailer::Base
  default from: "whattoeattonight@gmail.com"

  def forgot_password(user)
    @user = user
    @url = 'http://w2et.herokuapp.com/users/edit/' + @user.id.to_s
    mail(to: @user.email, subject: 'Welcome to W2ET, don\'t forget your fucking password')
  end
end