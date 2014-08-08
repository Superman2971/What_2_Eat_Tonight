class UserMailer < ActionMailer::Base
  default from: "whattoeattonight@gmail.com"

  def forgot_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: "goldfarb.ian@gmail.com", subject: 'Welcome to My Awesome Site')
  end
end
