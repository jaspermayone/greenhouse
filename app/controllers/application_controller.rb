# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Authenticatable

  after_action :track_action

  # def find_current_auditor
  #   nil if current_user.super_admin

  #   # current_user
  # end
  #

  protected

  def track_action
    ahoy.track "Ran action", request.path_parameters
  end

end
