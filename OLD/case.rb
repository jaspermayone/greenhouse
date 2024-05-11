# frozen_string_literal: true

class Case < ApplicationRecord
  belongs_to :agent
  has_and_belongs_to_many :entries
  encrypts :agent_id, deterministic: true
  encrypts :name, :description

end
