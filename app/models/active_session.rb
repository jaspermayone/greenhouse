# frozen_string_literal: true

class ActiveSession < ApplicationRecord
  has_secure_token :remember_token
  belongs_to :user
end
