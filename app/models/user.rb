class User < ApplicationRecord
  has_many :user_credentials, as: :credentials, dependent: :destroy
end
