# frozen_string_literal: true

module Classification
  extend ActiveSupport::Concern

  included do

    enum :classification, [
      :unclassified,
      :confidential,
      :secret,
      :top_secret
    ], scopes: false, default: :unclassified

  end
end
