# frozen_string_literal: true

class Entry < ApplicationRecord
  belongs_to :agent
  has_and_belongs_to_many :cases
  delegated_type :entryable, types: %w[Page], dependent: :destroy
  encrypts :name, :agent_id, deterministic: true

end
