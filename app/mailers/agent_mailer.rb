# frozen_string_literal: true

class AgentMailer < ApplicationMailer
  default from: "noreply@greenhouse.directory"

  def welcome(agent)
    @agent = agent
    mail(to: @agent.email, subject: "Welcome to Greenhouse. Your account is now active.")
  end

  def email_confirmation(agent)
    @agent = agent
    mail(to: @agent.email, subject: "[GREENHOUSE] Please confirm your email address.")
  end

  def password_reset(agent)
    @agent = agent
    mail(to: @agent.email, subject: "[GREENHOUSE] Reset your password.")
  end

end
