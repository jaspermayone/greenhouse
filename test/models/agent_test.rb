# frozen_string_literal: true

# == Schema Information
#
# Table name: agents
#
#  id              :bigint           not null, primary key
#  access_level    :integer          default("agent"), not null
#  active          :boolean          default(FALSE)
#  agent_email     :string
#  approved        :boolean          default(FALSE)
#  codename        :string
#  email           :string
#  full_name       :string
#  password_digest :string
#  string          :string
#  verified        :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_agents_on_agent_email  (agent_email) UNIQUE
#  index_agents_on_codename     (codename) UNIQUE
#  index_agents_on_email        (email) UNIQUE
#
require "test_helper"

class AgentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
