class User < ApplicationRecord
  has_person_name
  validates :email, uniqueness: true # standard:disable all
  has_secure_password
  encrypts :email, deterministic: true
  encrypts :admin, :super_admin, :first_name, :last_name
end
