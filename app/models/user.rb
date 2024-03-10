class User < ApplicationRecord
  has_secure_password
  has_person_name

  encrypts :email, :first_name, :last_name, :admin, :super_admin, :MASTER

  before_save :downcase_email
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}, presence: true, uniqueness: true
end
