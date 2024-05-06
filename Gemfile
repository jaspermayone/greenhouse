# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby File.read(File.join(File.dirname(__FILE__), ".ruby-version")).strip
# ruby "3.3.0"

gem "dotenv-rails", groups: [:development, :test]

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.1.3"

# The modern asset pipeline for Rails [https://github.com/rails/propshaft]
gem "propshaft"

# Use sqlite3 as the database for Active Record
# gem "sqlite3"
gem "sqlite3", "~> 2.0"


# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

gem "pg" # database
gem "pg_search" # full-text search
gem "redis", "~> 5.0" # for caching, jobs, etc. (Use Redis adapter to run Action Cable in production)

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
gem "bcrypt", "~> 3.1.7"

gem "jsbundling-rails", "~> 1.1"
gem "terser", "~> 1.1" # JS compressor
gem "jquery-rails"
gem "react-rails"
gem "turbo-rails" # Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "cssbundling-rails", "~> 1.4"
gem "sprockets-rails", "~> 3.4"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem "tzinfo-data", platforms: %i[windows jruby]

gem "bootsnap", ">= 1.4.4", require: false # reduces boot times through caching; required in config/boot.rb

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem "image_processing", "~> 1.2"

group :development, :staging do
  gem "query_count"

  gem "rack-mini-profiler", "~> 3.1"
  gem "stackprof" # used by `rack-mini-profiler` to provide flamegraphs
end

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[mri windows]
  gem "mass_encryption"
  # gem "solargraph"
  gem "tapioca", require: false

  gem "erb_lint", require: false
  gem "rubocop"
  gem "rubocop-rails", "~> 2.24"
  gem "relaxed-rubocop"
end

group :test do
  gem "factory_bot_rails" # Test data
  gem "simplecov", require: false # Code coverage
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
end

gem "sorbet-runtime"

group :development do
  gem "annotate" # comment models with database schema

  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "listen", "~> 3.8"
  gem "web-console"

  gem "letter_opener"
  gem "letter_opener_web", "~> 2.0"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"
  # gem "memory_profiler"
  # gem "stackprof"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
  #
  # Ruby language server
  gem "solargraph", require: false
  gem "solargraph-rails", "~> 1.1.0", require: false

  gem "htmlbeautifier", require: false # for https://marketplace.visualstudio.com/items?itemName=tomclose.format-erb

  gem "rails_hotreload"
  gem "sorbet"
end

gem "administrate", "~> 1.0.0.beta1"
gem "font-awesome-sass", "~> 6.5.2"
gem "bulma-rails"

# gem "audits1984"
# gem "console1984"

gem "name_of_person"

gem "bundler-audit"
gem "fasterer"
gem "overcommit"

gem "activerecord-session_store"
gem "postmark-rails"
gem "strong_migrations"

gem "rack-cors" # manage CORS
gem "rack-attack" # rate limiting
gem "browser", "~> 6.0" # browser detection
