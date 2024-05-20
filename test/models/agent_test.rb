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
#  new_agent_email :string
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
require "test_helper"

class AgentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
