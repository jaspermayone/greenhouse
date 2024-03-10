module Authenticatable
  extend ActiveSupport::Concern

  included do
    before_action :ensure_authenticated
  end

  def is_authenticated?
    if session[:current_authentication]
      true
    else
      false
    end
  end

  def is_authenticated_admin?
    if current_user.admin?
      true
    end
  end

  def is_super_admin?
    if current_user.super_admin?
      true
    end
  end

  def current_user
    session[:current_authentication]&.user
  end

  def ensure_authenticated
    if !is_authenticated?
      flash[:alert] = "You need to login to view that page."
      redirect_to new_user_authentication_path
    end
  end
end
