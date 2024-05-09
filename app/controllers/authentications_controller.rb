# frozen_string_literal: true

class AuthenticationsController < ApplicationController
  include Authenticatable

  before_action :ensure_authenticated, only: [:destroy]
  before_action :ensure_not_authenticated, only: [:new, :create]

  def new
    @user = User.new

    if session[:current_authentication]
      redirect_to enter_path
    else
      render "new"
    end
  end

  def create
    # @user = User.find_by(email: auth_params[:email])
    @user = User.find_by(email: auth_params[:email]) || User.find_by(agent_email: auth_params[:email])
    @access_level = @user&.access_level

    if @user&.authenticate(auth_params[:password])
      Authentication.new(session, @user)
      redirect_to enter_path
    else
      flash[:danger] = "Login failed. Please try again."
      render "new"
    end
  end

  def destroy
    session[:current_authentication].destroy(session)
    redirect_to login_path
  end

  private

  def auth_params
    params.require(:user).permit(:email, :password)
  end

end
