# frozen_string_literal: true

# == Schema Information
#
# Table name: mailboxes
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  agent_id   :bigint           not null
#
# Indexes
#
#  index_mailboxes_on_agent_id  (agent_id)
#
# Foreign Keys
#
#  fk_rails_...  (agent_id => agents.id)
#
class Mailbox < ApplicationRecord
  belongs_to :agent
  has_many :messages, dependent: :destroy


  def unread_messages
    messages.where(read: false)
  end

  def starred_messages
    messages.where(starred: true)
  end

  def archived_messages
    messages.where(archived: true)
  end

  def inbox_messages
    messages.where(archived: false)
  end

  private

end
