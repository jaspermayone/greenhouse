# frozen_string_literal: true

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

  def is_activated?
    if current_user.active?
      true
    end
  end

  def has_confirmed_email?
    if current_user.verified?
      true
    end
  end

  def current_user
    session[:current_authentication]&.agent
  end

  def ensure_login_ready
    if !is_activated?
      # TODO ~ SETUP THIS EMAIL SYSTEM
      flash[:info] = "Your account is not activated. You should expect an email confirmation of your activation within 48 hours of setting up your account. Please email activations@greenhouse.directory for assistance."
      redirect_to root_path
    elsif !has_confirmed_email?
      # TODO ~ SETUP THIS EMAIL SYSTEM
      flash[:warning] = "You need to confirm your email address. Please check your email for a confirmation link."
      redirect_to root_path
    end
  end

  def ensure_authenticated
    # FIXME: - this is broken, causes error "No route matches {:action=>"new", :controller=>"authentications", :server_id=>nil}"
    if !is_authenticated?
      flash[:warning=] = "You need to login to view that page."
      ahoy.track "Unauthorized access attempt"
      redirect_to main_app.login_path
    end
  end

  def ensure_not_authenticated
    if is_authenticated?
      flash[:info] = "You are already logged in."
      ahoy.track "User already logged in", agent: current_user
      redirect_to root_path
    end
  end

  def ensure_agent
    ensure_authenticated
    # ensure_login_ready
    unless current_user.agent?
      flash[:danger] = "You are not authorized to view that page."
      ahoy.track "Unauthorized access attempt for access level agent", agent: current_user
      redirect_to root_path
    end
  end

  def ensure_admin
    ensure_authenticated
    # ensure_login_ready
    unless current_user.admin?
      flash[:danger] = "You are not authorized to view that page."
      ahoy.track "Unauthorized access attempt for access level admin", agent: current_user
      redirect_to root_path
    end
  end

  def ensure_superadmin
    ensure_authenticated
    # ensure_login_ready
    unless current_user.superadmin?
      flash[:danger] = "You are not authorized to view that page."
      ahoy.track "Unauthorized access attempt for access level superadmin", agent: current_user
      redirect_to root_path
    end
  end

  def ensure_jasper
    ensure_authenticated
    # ensure_login_ready
    unless current_user.jasper?
      flash[:danger] = "You are not authorized to view that page."
      ahoy.track "Unauthorized access attempt for access level JASPER", agent: current_user
      redirect_to root_path
    end
  end


end
