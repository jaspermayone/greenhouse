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
require "test_helper"

class MailboxTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
