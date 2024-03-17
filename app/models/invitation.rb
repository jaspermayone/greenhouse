class Invitation < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :recipient, class_name: "User"

  validates :recipient_email, presence: true
  validate :recipient_is_not_registered

  before_create :generate_token

  def recipient_is_not_registered
    errors.add :recipient_email, "is already registered" if User.find_by(email: recipient_email)
  end

  def generate_token
    self.token = Digest::SHA1.hexdigest([sender_id, Time.now.utc, rand].join)
  end

  def send_invitation_email
    UserMailer.invitation_email(self).deliver_now

    update_attribute(:sent_at, Time.now.utc)

    self
  end

  def accept_invitation
    update_attribute(:accepted_at, Time.now.utc)

    recipient.update_attribute(:invitation_accepted_at, Time.now.utc)

    self
  end
end
