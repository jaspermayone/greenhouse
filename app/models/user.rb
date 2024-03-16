class User < ApplicationRecord
  has_many :user_credentials, as: :credentials, dependent: :destroy
  has_secure_password

  validates :email, presence: true, uniqueness: true
  # TODO: ADD PASSWORD REQUIREMENTS
  # validates :password, presence: true, length: {minimum: 8}
  validates :password, presence: true
end
