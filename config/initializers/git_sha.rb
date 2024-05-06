# frozen_string_literal: true

# Set git hash and other environment variables

COMMIT_HASH = `git rev-parse HEAD`.to_s.strip

if Rails.env.development?
  COMMIT_HASH_SHORT = "DEVELOPMENT"
  APP_VERSION = "DEVELOPMENT"
  RAILS_VERSION = Rails.version
else
  COMMIT_HASH_SHORT = `git rev-parse --short=8 HEAD`.to_s.strip
  APP_VERSION = "ENV: #{Rails.env} @ #{Time.now.utc.strftime("%Y-%m-%d %H-%M UTC")}".freeze
end
