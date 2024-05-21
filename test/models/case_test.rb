# frozen_string_literal: true

# == Schema Information
#
# Table name: cases
#
#  id             :bigint           not null, primary key
#  classification :integer          default(0), not null
#  classified     :boolean
#  description    :text
#  name           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  agents_id      :bigint
#
# Indexes
#
#  index_cases_on_agents_id  (agents_id)
#
require "test_helper"

class CaseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
