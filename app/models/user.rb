# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  scope :admin, -> { where(access_level: [:admin, :superadmin]) }

  enum :access_level, [
    :user,
    :admin,
    :superadmin,
    :JASPER
  ], scopes: false, default: :user

  encrypts :email, deterministic: true

  before_create :set_agent_email

  validates_presence_of :full_name, :email, :password, :codename

  validates :full_name, format: {
    with: /\A[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð.,'-]+ [a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð.,' -]+\z/,
    message: "must contain your first and last name, and can't contain special characters.", allow_blank: true,
  }

  validates :email, uniqueness: true, presence: true
  validates_email_format_of :email
  # TODO: ADD PASSWORD REQUIREMENTS
  # validates :password, presence: true, length: {minimum: 8}
  validates :password, presence: true

  def admin?
    self.access_level == "admin" || self.access_level == "superadmin" || self.access_level == "JASPER"
  end

  def make_admin!
    admin!
  end

  def remove_admin!
    user!
  end

  def first_name(legal: false)
    @first_name ||= (namae(legal:)&.given || namae(legal:)&.particle)&.split(" ")&.first
  end

  def last_name(legal: false)
    @last_name ||= namae(legal:)&.family&.split(" ")&.last
  end

  def active_mailbox_address
    self.agent_email
  end

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

  def set_agent_email
    # self.agent_email
    # set email to be the codename feaild @postal
    codenm = self.codename.downcase
    self.agent_email = "a_#{codenm}@postal.greenhouse.directory"
  end

  def generate_token
    SecureRandom.hex(10)
  end

end
