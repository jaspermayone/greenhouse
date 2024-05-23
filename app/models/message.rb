# frozen_string_literal: true

# == Schema Information
#
# Table name: messages
#
#  id          :bigint           not null, primary key
#  attachments :string           default([]), is an Array
#  bcc         :string           default([]), is an Array
#  body        :text             not null
#  cc          :string           default([]), is an Array
#  from        :string           not null
#  read        :boolean          default(FALSE)
#  received_at :datetime
#  sent_at     :datetime
#  subject     :string           not null
#  to          :string           default([]), is an Array
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  agent_id    :bigint           not null
#  mailbox_id  :bigint           not null
#
# Indexes
#
#  index_messages_on_agent_id    (agent_id)
#  index_messages_on_mailbox_id  (mailbox_id)
#
# Foreign Keys
#
#  fk_rails_...  (agent_id => agents.id)
#  fk_rails_...  (mailbox_id => mailboxes.id)
#
class Message < ApplicationRecord
  belongs_to :mailbox
  belongs_to :agent
  has_many_attached :attachments

  # enrcypts :agent_id, :from, :to, :cc, :bcc, :subject, :read, :sent_at, :received_at, deterministic: true
  # encrypts :body

end
