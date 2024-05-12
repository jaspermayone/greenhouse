# frozen_string_literal: true

class AgentsMailbox < ApplicationMailbox
  include HasAttachments

  before_processing :set_agent
  before_processing :set_attachments

  def process
    # if agent is nil set mailbox to the default mailbox (id of 1) else set mailbox to the agent's mailbox
    mailbox = @agent.nil? ? Mailbox.find(1) : @agent.mailbox

    Message.create(
      mailbox:,
      agent: @agent,
      from: mail.from.first,
      to: mail.to,
      cc: mail.cc,
      bcc: mail.bcc,
      subject: mail.subject,
      body: mail.body.decoded,
      sent_at: mail.date,
      received_at: Time.now,
      attachments: @attachments
    )


  end

  private

  def set_agent
    @agent = Agent.find_by(secure_email: mail.to.first)
  end

end
