class AuthController < ApplicationController
  def new
  end

  def create
    u = User.find_by(email: params[:email])

    if u.blank? ? false : u.authenticate(params[:password])
      session[:user_id] = u.id
      redirect_to root_path
    else
      flash[:alert] = "Invalid email or password"
      redirect_to new_auth_path

    end
  end
end
