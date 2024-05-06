# frozen_string_literal: true

class AgentsMailbox < ApplicationMailbox
  def process
    return TestMailer.hello(mail.to.first).deliver_now
  end

end
