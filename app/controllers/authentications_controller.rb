# frozen_string_literal: true

class AuthenticationsController < ApplicationController
  before_action :ensure_authenticated, only: [:destroy]
  before_action :ensure_not_authenticated, only: [:new, :create]

  invisible_captcha only: [:new], honeypot: :loginid, on_timestamp_spam: :redirect_to_404


  def new
    @agent = Agent.new

    if session[:current_authentication]
      redirect_to enter_path
    else
      render "new"
    end
  end

  def create
    @agent = Agent.find_by(email: auth_params[:email]) || Agent.find_by(agent_email: auth_params[:email])
    @access_level = @agent&.access_level

    if @agent&.authenticate(auth_params[:password])
      Authentication.new(session, @agent)
      redirect_to root_path
      ahoy.authenticate(@agent)
      ahoy.track "Logged in", email: auth_params[:email]
    else
      flash[:danger] = "Login failed. Please try again."
      ahoy.track "Failed login attempt", email: auth_params[:email]
      render "new"
    end
  end

  def destroy
    ahoy.track "Logged out", email: session[:current_authentication].email
    session[:current_authentication].destroy(session)
    redirect_to login_path
  end

  private

  def auth_params
    params.require(:agent).permit(:email, :password)
  end

end
