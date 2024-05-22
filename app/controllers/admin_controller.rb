# frozen_string_literal: true

class AdminController < ApplicationController
  include Authenticatable

  before_action :ensure_admin

  def find_current_auditor
    current_agent
  end

end
