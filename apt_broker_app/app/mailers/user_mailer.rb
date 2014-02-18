class UserMailer < ActionMailer::Base
  default from: "from@example.com"

    def welcome_email(user)
      @user = user

      @url  = "http://localhost:3000/users/#{user.id}/confirm/#{user.confirmation_code}"
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
