class User < ApplicationRecord
  # FIXME: Change this to actual domain
  MAILER_FROM_EMAIL = "no-reply@example.com"
  MAILER_FROM_NAME = "Example Company Notifications"

  has_secure_password
  has_person_name

  encrypts :email, :password_digest, :unconfirmed_email, deterministic: true

  before_save :downcase_email
  before_save :downcase_unconfirmed_email

  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}, presence: true, uniqueness: true
end
