# frozen_string_literal: true

class DetailsController < ApplicationController
  before_action :authenticate_user!

  def index
  end
end
