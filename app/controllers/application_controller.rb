class ApplicationController < ActionController::Base
  include Authentication

  def find_current_auditor
    return if current_user.super_admin

    current_user
  end
end
