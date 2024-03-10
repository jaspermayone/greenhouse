
class Case < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :entries
  encrypts :user_id, deterministic: true
  encrypts :name, :description
end
