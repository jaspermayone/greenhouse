# frozen_string_literal: true

class Page < ApplicationRecord
  include Entryable
  has_rich_text :content, encrypted: true
  # encrypts : , deterministic: true
  # encrypts:
end
