# frozen_string_literal: true

class AdminController < ApplicationController
  include Authenticatable

  # FIXME: this causes a redirect loop on /admin/jobs
  before_action :ensure_authenticated, :ensure_login_ready, :ensure_super_admin

end
