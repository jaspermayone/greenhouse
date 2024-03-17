class User::Credential < ApplicationRecord
  encrypts :name
  belongs_to :user
end
