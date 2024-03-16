class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  # TODO: ADD PASSWORD REQUIREMENTS
  # validates :password, presence: true, length: {minimum: 8}
  validates :password, presence: true
end
