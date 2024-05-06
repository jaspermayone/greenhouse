# frozen_string_literal: true

class FallbackMailbox < ApplicationMailbox
  def process
    return TestMailer.hello(mail.to.first).deliver_now
  end

end
