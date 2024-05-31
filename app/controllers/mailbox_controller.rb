# frozen_string_literal: true

class MailboxController < ApplicationController
  before_action :ensure_agent

  def index
    @agent = current_user
    @mailbox = @agent&.mailbox
    @messages = @mailbox&.messages

  end

end
