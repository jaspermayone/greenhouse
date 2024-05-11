# frozen_string_literal: true

class AdminController < ApplicationController
  include Authenticatable

  before_action :ensure_admin

end
