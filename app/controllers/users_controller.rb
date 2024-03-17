class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    @user.save!
  end

  def update
    @user = User.find(params.require(:id))
    @user.update!(user_params)
  end

  def destroy
    # Don't actually delete the user, just mark them as inactive (for data reasons)
    # ative is a feild in the database under the users table
    @user = User.find(params.require(:id))
    @user.active = false
    @user.save!
  end

  private

  # Using a private method to encapsulate the permissible parameters
  # is just a good pattern since you'll be able to reuse the same
  # permit list between create and update. Also, you can specialize
  # this method with per-user checking of permissible attributes.
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
