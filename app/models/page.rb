class Page < ApplicationRecord
  include Entryable
  has_rich_text :content
end
