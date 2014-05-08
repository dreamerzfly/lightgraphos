class UserMailer < ActionMailer::Base
  default from: "info@clyqe.com"

  def welcome_email(user)
  	@user = user
  	mail(to: @user.email, subject: 'Welcome to ClyQe')
  end

  def cancel_email(user)
  	@user = user
  	mail(to: @user.email, subject: 'ClyQe Account Cancelled')
  end
end
