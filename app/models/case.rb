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
class Case < ApplicationRecord
  include Classification
  attribute :classification, :integer

  # enrcypts :name, :classification, :agents_id, deterministic: true
  # encrypts :description

  has_and_belongs_to_many :agents

  def is_classified
    self.classification
  end

  def declasify!
    self.classified = false
    self.classification = :unclassified
  end

  def classify(classification)
    self.classified = true
    self.classification = classification
  end

end
