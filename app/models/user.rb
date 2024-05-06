# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  encrypts :email, deterministic: true

  # FIXME: TEMPORRARILY DISABLED AS INVITE SYSTEM IS NOT IMPLEMENTED, and needs an inverse_of which i dont understand
  # has_many :sent_invitations, class_name: "Invitation", foreign_key: "sender_id", dependent: :restrict_with_exception
  # has_one :received_invitation, class_name: "Invitation", foreign_key: "recipient_id", dependent: :restrict_with_exception

  validates :email, presence: true, uniqueness: true
  # TODO: ADD PASSWORD REQUIREMENTS
  # validates :password, presence: true, length: {minimum: 8}
  validates :password, presence: true

  def generate_password_token!
    self.reset_password_token = generate_token
    self.reset_password_sent_at = Time.now.utc
    save!
  end

  def password_token_valid?
    (reset_password_sent_at + 15.minutes) > Time.now.utc
  end

  def reset_password!(password)
    self.reset_password_token = nil
    self.password = password
    save!
  end

  def update_new_email!(email)
    self.unconfirmed_email = email
    generate_confirmation_instructions
    save!
  end

  def self.email_used?(email)
    existing_user = find_by("email = ?", email)

    if existing_user.present?
      true
    else
      waiting_for_confirmation = find_by("unconfirmed_email = ?", email)
      waiting_for_confirmation.present? && waiting_for_confirmation.confirmation_token_valid?
    end
  end

  private

  def generate_token
    SecureRandom.hex(10)
  end

end
