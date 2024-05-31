# frozen_string_literal: true

class AdminController < ApplicationController
  before_action :ensure_admin

  def find_current_auditor
    ahoy.track "Found current auditor", request.path_parameters
    current_user
  end

end
