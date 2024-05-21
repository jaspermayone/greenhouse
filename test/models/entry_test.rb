# frozen_string_literal: true

# == Schema Information
#
# Table name: entries
#
#  id             :bigint           not null, primary key
#  classification :integer          default(0), not null
#  entryable_type :string
#  name           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  agents_id      :bigint
#  entryable_id   :integer
#
# Indexes
#
#  index_entries_on_agents_id  (agents_id)
#
require "test_helper"

class EntryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
