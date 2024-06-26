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
class Entry < ApplicationRecord
  has_paper_trail

  include Classification
  attribute :classification, :integer

  # enrcypts :name, :agents_id, :classification, deterministic: true

  belongs_to :agent
  has_and_belongs_to_many :cases
  delegated_type :entryable, types: %w[Page], dependent: :destroy

end
