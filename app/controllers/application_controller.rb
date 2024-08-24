# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Authenticatable

  # def find_current_auditor
  #   nil if current_user.super_admin

  #   # current_user
  # end
  #
  #

  helper_method :current_user

  def current_user
    # Assuming you use session to store current user ID
    @current_user ||= Agent.find_by(id: session[:current_authentication]&.agent)
  end

end
