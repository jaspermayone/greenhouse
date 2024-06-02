# frozen_string_literal: true

# == Schema Information
#
# Table name: agent_alias_contacts
#
#  id             :bigint           not null, primary key
#  address        :string
#  email_address  :string
#  phone_number   :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  agent_alias_id :bigint           not null
#
# Indexes
#
#  index_agent_alias_contacts_on_agent_alias_id  (agent_alias_id)
#
# Foreign Keys
#
#  fk_rails_...  (agent_alias_id => agent_aliases.id)
#
require "test_helper"

module Agent
  module Alias
    class ContactTest < ActiveSupport::TestCase
      # test "the truth" do
      #   assert true
      # end
    end
  end
end
