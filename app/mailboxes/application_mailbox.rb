# frozen_string_literal: true

class ApplicationMailbox < ActionMailbox::Base
  # routing /something/i => :somewhere

  # match agent emails to the AgentsMailbox
  # example emails to match: a_lepord@postal.greenhouse.directory, a_penguin@postal.greenhouse.directory, a_monkey@postal.greenhouse.directory
  # match any email that starts with a_
  # routing /^a_/i => :agents
  routing(/^a_/i => :agents)



  # fallback
  routing all: :fallback

  # Helper methods
  private

  def html
    mail.html_part&.body&.decoded
  end

  def text
    mail.text_part&.body&.decoded
  end

  def body
    mail.body&.decoded&.presence
  end

end
