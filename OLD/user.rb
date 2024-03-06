class User < ApplicationRecord
  has_secure_password
  has_person_name

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  encrypts :email, deterministic: true
  encrypts :admin, :super_admin, :first_name, :last_name
end
