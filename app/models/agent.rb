# frozen_string_literal: true

# == Schema Information
#
# Table name: agents
#
#  id                     :bigint           not null, primary key
#  access_level           :integer          default("agent"), not null
#  active                 :boolean          default(FALSE)
#  agent_email            :string
#  approved               :boolean          default(FALSE)
#  approved_at            :datetime
#  codename               :string
#  email                  :string
#  full_name              :string
#  has_verified_email     :boolean          default(FALSE)
#  last_verified_email_at :datetime
#  password_digest        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  approved_by_id         :bigint
#
# Indexes
#
#  index_agents_on_agent_email     (agent_email) UNIQUE
#  index_agents_on_approved_by_id  (approved_by_id)
#  index_agents_on_codename        (codename) UNIQUE
#  index_agents_on_email           (email) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (approved_by_id => agents.id)
#
#


# module Agent
#   def self.table_name_prefix
#     "agent_"
#   end

class Agent < ApplicationRecord
  has_secure_password
  has_paper_trail


  scope :admin, -> { where(access_level: [:admin, :superadmin]) }

  enum :access_level, [
    :agent,
    :admin,
    :superadmin,
    :JASPER
  ], scopes: false, default: :agent

  scope :agent, -> { where(access_level: [:agent, :admin, :superadmin, :JASPER]) }
  scope :admin, -> { where(access_level: [:admin, :superadmin, :JASPER]) }
  scope :superadmin, -> { where(access_level: [:superadmin, :JASPER]) }
  scope :jasper, -> { where(access_level: :JASPER) }

  # validates :codename, uniqueness: true, presence: true
  validates :codename, uniqueness: true

  has_one :mailbox, dependent: :destroy
  has_many :messages, dependent: :destroy

  has_and_belongs_to_many :cases

  encrypts :email, deterministic: true

  before_create :set_agent_email
  after_create :create_mailbox
  after_commit :notify_admin_of_new_agent, on: :create

  validates :full_name, format: {
    with: /\A[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð.,'-]+ [a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð.,' -]+\z/,
    message: "must contain your first and last name, and can't contain special characters.", allow_blank: true,
  }

  validates :email, uniqueness: true, presence: true
  validates_email_format_of :email
  normalizes :email, with: ->(email) { email.strip.downcase }

  normalizes :agent_email, with: ->(email) { email.strip.downcase }

  validates :codename, uniqueness: true, presence: true
  validates_presence_of :full_name, :email
  validates :password, presence: true
  # TODO: ADD PASSWORD REQUIREMENTS
  # validates :password, presence: true, length: {minimum: 8}

  # encrypts :full_name
  # encrypts :email, :codename, :approved, :verified, deterministic: true

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
    AgentMailer.notify_is_admin(self).deliver_now
    AdminMailer.notify_new_admin(self).deliver_now
  end

  def remove_admin!
    agent!
    AdminMailer.notify_admin_removed(self).deliver_now
  end

  # approve function that takes in an approving agent as an arg
  def approve!(approving_agent)
    self.approved = true
    self.approved_by = approving_agent
    self.approved_at = Time.now.utc
    save!
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

  # TODO: handle setting of last_verified_email_at

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

  def notify_admin_of_new_agent
    AdminMailer.notify_new_agent_for_approval(self).deliver_now
  end

  def set_agent_email
    # self.agent_email
    # set email to be the codename feaild @postal
    codenm = self.codename.downcase
    self.agent_email = "a_#{codenm}@postal.greenhouse.directory"
  end

  def generate_token
    SecureRandom.hex(10)
  end

  def create_mailbox
    Mailbox.create(agent: self)
  end

end

# end
