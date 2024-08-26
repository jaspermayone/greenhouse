# frozen_string_literal: true

class AdminController < ApplicationController
  before_action :ensure_admin

  def find_current_auditor
    current_user
  end


  def index
  end

  def agents
    @agents = Agent.all
  end

  def sessions
    @sessions = Session.all.map do |session|
          {
            session_id: session.session_id,
            created_at: session.created_at,
            data: parse_session_data(session.data)
          }
        end
  end

  private

    def parse_session_data(data)
      begin
        Marshal.load(Base64.decode64(data))
      rescue => e
        Rails.logger.error("Failed to parse session data: #{e.message}")
        {}
      end
    end

end
