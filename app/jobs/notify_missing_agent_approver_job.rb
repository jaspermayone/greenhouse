# frozen_string_literal: true

class NotifyMissingAgentApproverJob < ApplicationJob
  queue_as :default

  def perform
    Agent.where(approved: true, approved_by: nil).find_each do |agent|
      AdminMailer.notify_missing_approver(agent).deliver_now
    end
  end

end
