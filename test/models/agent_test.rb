# frozen_string_literal: true

# == Schema Information
#
# Table name: agents
#
#  id                 :bigint           not null, primary key
#  access_level       :integer          default("agent"), not null
#  active             :boolean          default(FALSE)
#  agent_email        :string
#  approved           :boolean          default(FALSE)
#  approvwed_at       :datetime
#  codename           :string
#  email              :string
#  full_name          :string
#  has_verified_email :boolean          default(FALSE)
#  password_digest    :string
#  string             :string
#  verified           :boolean          default(FALSE)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  approved_by_id     :bigint
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
require "test_helper"

class AgentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
