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
    if current_user.email_confirmed?
      true
    end
  end

  def current_user
    session[:current_authentication]&.user
  end

  def ensure_login_ready
    if !is_activated?
      # SETUP THIS EMAIL SYSTEM
      flash[:info] = "Your account is not activated. You should expect an email confirmation of your activation within 48 hours of setting up your account. Please email activations@greenhouse.obl.ong for assistance."
      redirect_to root_path
    elsif !has_confirmed_email?
      # SETUP THIS EMAIL SYSTEM
      flash[:warning] = "You need to confirm your email address. Please check your email for a confirmation link."
      redirect_to root_path
    end
  end

  def ensure_authenticated
    if !is_authenticated?
      flash[:warning=] = "You need to login to view that page."
      redirect_to login_path
    end
  end

  def ensure_not_authenticated
    if is_authenticated?
      flash[:info] = "You are already logged in."
      redirect_to root_path
    end
  end

  def ensure_admin
    if !current_user.admin?
      flash[:danger] = "You are not authorized to view that page."
      redirect_to root_path
    end
  end

  def ensure_super_admin
    if !current_user.super_admin?
      flash[:danger] = "You are not authorized to view that page."
      redirect_to root_path
    end
  end
end
