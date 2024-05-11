# frozen_string_literal: true

class SearchController < ApplicationController
  include Authenticatable

  before_action :ensure_agent

  def index
  end

end
