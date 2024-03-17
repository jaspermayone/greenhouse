class UsersController < ApplicationController
  before_action :validate_email_update, only: :update

  def new
  end

  def create
    @user = User.new(user_params)
    @user.save!
  end

  def update
    if current_user.update_new_email!(@new_email)
      # SEND EMAIL HERE
      render json: {status: "Email Confirmation has been sent to your new email."}, status: :ok
    else
      render json: {errors: current_user.errors.values.flatten.compact}, status: :bad_request
    end
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

  def validate_email_update
    @new_email = params[:email].to_s.downcase

    if @new_email.blank?
      return render json: {status: "Email cannot be blank"}, status: :bad_request
    end

    if @new_email == current_user.email
      return render json: {status: "Current Email and New email cannot be the same"}, status: :bad_request
    end

    if User.email_used?(@new_email)
      render json: {error: "Email is already in use."}, status: :unprocessable_entity
    end
  end
end
