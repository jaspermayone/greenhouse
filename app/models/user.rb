class User < ApplicationRecord
  has_secure_password

  has_many :sent_invitations, class_name: "Invitation", foreign_key: "sender_id", dependent: :restrict_with_exception
  has_one :received_invitation, class_name: "Invitation", foreign_key: "recipient_id", dependent: :restrict_with_exception

  validates :email, presence: true, uniqueness: true
  # TODO: ADD PASSWORD REQUIREMENTS
  # validates :password, presence: true, length: {minimum: 8}
  validates :password, presence: true
end
