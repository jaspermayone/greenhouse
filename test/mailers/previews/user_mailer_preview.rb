# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/confirmation
  def confirmation
    user = User.new(email: "test@example.com")
    token = "TEST1234"

    UserMailer.confirmation(user, token)
  end

  def password_reset
    user = User.new(email: "test@example.com")
    token = "TEST1234"

    UserMailer.password_reset(user, token)
  end
end
