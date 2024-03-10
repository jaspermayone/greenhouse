class UserMailer < ApplicationMailer
  default from: email_address_with_name(User::MAILER_FROM_EMAIL, User::MAILER_FROM_NAME)

  # def magic(user, magic_token, email)
  #   @user = user
  #   @magic_token = magic_token
  #   @email = email

  #   mail to: @email, subject: "[GREENHOUSE] Magic Link"
  # end

  # def password_reset(user, password_reset_token)
  #   @user = user
  #   @password_reset_token = password_reset_token

  #   mail to: @user.email, subject: "[GREENHOUSE] Password Reset Instructions"
  # end
end
