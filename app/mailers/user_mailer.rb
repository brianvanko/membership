class UserMailer < ActionMailer::Base
  default from: 'notifications@membership.com'
 
  def welcome_email(user)
    @user = user
    @url  = 'https://membership.com/users/sign_in/'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
