# frozen_string_literal: true

class RootController < ApplicationController
  include Authenticatable

  def index
  end

  def enter
    if is_authenticated?
      redirect_to search_index_path
    else
      redirect_to login_path
    end
  end

end
