# frozen_string_literal: true

class AgentsMailbox < ApplicationMailbox
  before_processing :set_agent

  def process
    return TestMailer.hello(mail.to.first).deliver_now
  end

  private

  def set_agent
    # @agent = Agent.find_by
  end

end
