# frozen_string_literal: true

class AuthenticationsController < ApplicationController
  before_action :ensure_authenticated, only: [:destroy]
  before_action :ensure_not_authenticated, only: [:new, :create]

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

    if @agent && @agent.authenticate(auth_params[:password])
       Authentication.new(session, @agent)
       redirect_to root_path
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
    params.require(:agent).permit(:email, :password)
  end

end
