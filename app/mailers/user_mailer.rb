# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: "noreply@greenhouse.directory"

  def invite(user, invitation)
    @user = user
    @invitation = invitation
    mail(to: @invitation.email, subject: "Your invitation to Greenhouse.")
  end

  def welcome(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to Greenhouse. Your account is now active.")
  end

  def email_confirmation(user)
    @user = user
    mail(to: @user.email, subject: "[GREENHOUSE] Please confirm your email address.")
  end

  def password_reset(user)
    @user = user
    mail(to: @user.email, subject: "[GREENHOUSE] Reset your password.")
  end

end
