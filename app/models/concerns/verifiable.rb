# frozen_string_literal: true

module Verifiable
  extend ActiveSupport::Concern

  included do
  end

  def verify_email(agent)
    @agent = agent
    VerificationMailer.create!(@agent).deliver_now
  end

  def mark_as_verified
    update_attribute(:email_confirmed, true)
  end
end
