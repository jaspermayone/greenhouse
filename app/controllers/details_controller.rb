# frozen_string_literal: true

class DetailsController < ApplicationController
  include Authenticatable

  before_action :ensure_authenticated, :ensure_login_ready, :ensure_level_0

  def index
  end

end
