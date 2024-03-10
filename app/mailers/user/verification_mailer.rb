class User::VerificationMailer < ApplicationMailer
  def create(user)
    @user = user

    mail to: user.email, subject: "[GREENHOUSE] Verify your email"
  end
end
