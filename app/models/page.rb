# frozen_string_literal: true

# == Schema Information
#
# Table name: pages
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Page < ApplicationRecord
  has_paper_trail

  include Entryable

  has_rich_text :content, encrypted: true
  # encrypts : , deterministic: true
  # encrypts:

end
