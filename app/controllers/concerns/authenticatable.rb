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

  def is_not_authenticated?
    !is_authenticated?
  end

  def current_user
    session[:current_authentication]&.user
  end

  def ensure_authenticated
    if !is_authenticated?
      flash[:alert] = "You need to login to view that page."
      redirect_to login_path
    end
  end

  def ensure_not_authenticated
    if is_authenticated?
      flash[:alert] = "You are already logged in."
      redirect_to root_path
    end
  end

  def ensure_admin
    if !current_user.admin?
      flash[:alert] = "You are not authorized to view that page."
      redirect_to root_path
    end
  end

  def ensure_super_admin
    if !current_user.super_admin?
      flash[:alert] = "You are not authorized to view that page."
      redirect_to root_path
    end
  end
end
