class AuthenticationsController < ApplicationController
  def new
    # TODO: login page
  end

  def create
    user = User.find_by(params[:email])
    Authentication.new(session, user)
    redirect_to root_path
  end

  def delete
    # TODO: logout page
  end

  def destroy
    session[:current_authentication].destroy(session)
  end
end
