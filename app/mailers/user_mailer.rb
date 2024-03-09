# frozen_string_literal: true

class UserMailer < ApplicationMailer
  # default from: User::MAILER_FROM_EMAIL
  default from: email_address_with_name(User::MAILER_FROM_EMAIL, User::MAILER_FROM_NAME)

  def confirmation(user, confirmation_token)
    @user = user
    @confirmation_token = confirmation_token

    mail to: @user.confirmable_email, subject: '[GREENHOUSE] Confirmation Instructions'
  end

  def password_reset(user, password_reset_token)
    @user = user
    @password_reset_token = password_reset_token

    mail to: @user.email, subject: '[GREENHOUSE] Password Reset Instructions'
  end
end
