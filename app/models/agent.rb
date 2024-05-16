# frozen_string_literal: true

# == Schema Information
#
# Table name: agents
#
#  id              :bigint           not null, primary key
#  access_level    :integer          default("agent"), not null
#  active          :boolean          default(FALSE)
#  approved        :boolean          default(FALSE)
#  codename        :string
#  email           :string
#  full_name       :string
#  password_digest :string
#  secure_email    :string
#  string          :string
#  verified        :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_agents_on_codename      (codename) UNIQUE
#  index_agents_on_email         (email) UNIQUE
#  index_agents_on_secure_email  (secure_email) UNIQUE
#
class Agent < ApplicationRecord
  has_secure_password

  scope :admin, -> { where(access_level: [:admin, :superadmin]) }

  enum :access_level, [
    :agent,
    :admin,
    :superadmin,
    :JASPER
  ], scopes: false, default: :agent

  has_one :mailbox, dependent: :destroy
  has_many :messages, dependent: :destroy

  encrypts :email, deterministic: true

  before_create :set_secure_email
  after_create :create_mailbox

  validates_presence_of :full_name, :email, :password, :codename

  validates :full_name, format: {
    with: /\A[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð.,'-]+ [a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð.,' -]+\z/,
    message: "must contain your first and last name, and can't contain special characters.", allow_blank: true,
  }

  validates :email, uniqueness: true, presence: true
  validates_email_format_of :email
  # todo: ADD PASSWORD REQUIREMENTS
  # validates :password, presence: true, length: {minimum: 8}
  validates :password, presence: true

  def agent?
    self.access_level == "agent" || self.access_level == "admin" || self.access_level == "superadmin" || self.access_level == "JASPER"
  end

  def admin?
    self.access_level == "admin" || self.access_level == "superadmin" || self.access_level == "JASPER"
  end

  def superadmin?
    self.access_level == "superadmin" || self.access_level == "JASPER"
  end

  def jasper?
    self.access_level == "JASPER"
  end

  def make_admin!
    admin!
  end

  def remove_admin!
    agent!
  end

  def first_name(legal: false)
    @first_name ||= (namae(legal:)&.given || namae(legal:)&.particle)&.split(" ")&.first
  end

  def last_name(legal: false)
    @last_name ||= namae(legal:)&.family&.split(" ")&.last
  end

  def active_mailbox_address
    self.secure_email
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
    existing_agent = find_by("email = ?", email)

    if existing_agent.present?
      true
    else
      waiting_for_confirmation = find_by("unconfirmed_email = ?", email)
      waiting_for_confirmation.present? && waiting_for_confirmation.confirmation_token_valid?
    end
  end

  private

  def set_secure_email
    # self.secure_email
    # set email to be the codename feaild @postal
    codenm = self.codename.downcase
    self.secure_email = "a_#{codenm}@postal.greenhouse.directory"
  end

  def generate_token
    SecureRandom.hex(10)
  end

  def create_mailbox
    Mailbox.create(agent: self)
  end

end
