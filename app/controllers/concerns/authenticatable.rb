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
    if current_agent.active?
      true
    end
  end

  def has_confirmed_email?
    if current_agent.verified?
      true
    end
  end

  def current_agent
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
      redirect_to login_path
    end
  end

  def ensure_not_authenticated
    if is_authenticated?
      flash[:info] = "You are already logged in."
      redirect_to enter_path
    end
  end

  def ensure_agent
    ensure_authenticated
    # ensure_login_ready
    unless current_agent.agent?
      flash[:danger] = "You are not authorized to view that page."
      redirect_to root_path
    end
  end

  def ensure_admin
    ensure_authenticated
    # ensure_login_ready
    unless current_agent.admin?
      flash[:danger] = "You are not authorized to view that page."
      redirect_to root_path
    end
  end

  def ensure_superadmin
    ensure_authenticated
    # ensure_login_ready
    unless current_agent.superadmin?
      flash[:danger] = "You are not authorized to view that page."
      redirect_to root_path
    end
  end

  def ensure_jasper
    ensure_authenticated
    # ensure_login_ready
    unless current_agent.jasper?
      flash[:danger] = "You are not authorized to view that page."
      redirect_to root_path
    end
  end


end
