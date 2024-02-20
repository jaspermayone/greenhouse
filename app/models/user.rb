class User < ApplicationRecord
  validates :email, uniqueness: true # standard:disable all
  has_secure_password
  encrypts :email, :first_name, :last_name, deterministic: true
  encrypts :admin, :super_admin
end
