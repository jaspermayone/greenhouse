class AuthenticationsController < ApplicationController
  include Authenticatable

  before_action :ensure_authenticated, only: [:destroy]
  before_action :ensure_not_authenticated, only: [:new, :create]

  def new
    @user = User.new

    if session[:current_authentication]
      redirect_to root_path
    else
      render "new"
    end
  end

  def create
    user = User.find_by(params[:email])

    if user&.authenticate(params[:password])
      Authentication.new(session, user)
      redirect_to root_path
    else
      flash[:error] = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:current_authentication].destroy(session)
    redirect_to login_path
  end
end
