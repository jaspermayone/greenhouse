# frozen_string_literal: true

module Authenticatable
  extend ActiveSupport::Concern

  included do
    before_action :ensure_authenticated
  end

  def is_authenticated?
    session[:current_authentication].present?
  end


  def is_activated?
    current_user&.active? # Will return false if current_user is nil
  end

  def has_confirmed_email?
    current_user&.verified? # Will return false if current_user is nil
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
      redirect_to main_app.login_path
    end
  end

  def ensure_not_authenticated
    if is_authenticated?
      flash[:info] = "You are already logged in."
      redirect_to root_path
    end
  end

  def ensure_agent
    ensure_authenticated
    # ensure_login_ready
    if current_user.nil? || !current_user.agent?
      flash[:danger] = "You are not authorized to view that page."
      redirect_to root_path
    end
  end

  def ensure_admin
    ensure_authenticated
    # ensure_login_ready
    unless current_user.admin?
      flash[:danger] = "You are not authorized to view that page."
      redirect_to root_path
    end
  end

  def ensure_superadmin
    ensure_authenticated
    # ensure_login_ready
    unless current_user.superadmin?
      flash[:danger] = "You are not authorized to view that page."
      redirect_to root_path
    end
  end

  def ensure_jasper
    ensure_authenticated
    # ensure_login_ready
    unless current_user.jasper?
      flash[:danger] = "You are not authorized to view that page."
      redirect_to root_path
    end
  end


end
