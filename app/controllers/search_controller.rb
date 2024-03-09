# frozen_string_literal: true

class SearchController < ApplicationController
  before_action :authenticate_user!

  def index; end
end
