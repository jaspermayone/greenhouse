class Entry < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :cases
  delegated_type :entryable, types: %w[Page], dependent: :destroy
end
