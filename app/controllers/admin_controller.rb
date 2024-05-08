# frozen_string_literal: true

class AdminController < ApplicationController
  include Authenticatable

  before_action :ensure_authenticated, :ensure_login_ready, :ensure_super_admin

end
