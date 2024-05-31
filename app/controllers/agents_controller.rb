# frozen_string_literal: true

class AgentsController < ApplicationController
  # TODO: move agent/new page to admin namespace

  before_action :validate_email_update, only: :update

  invisible_captcha only: [:new], honeypot: :loginid, on_timestamp_spam: :redirect_to_404

  before_action :ensure_admin, only: [:new, :create]

  def new
    @agent = Agent.new
  end

  def create
    @agent = Agent.new(agent_params)
    @agent.save!
    ahoy.track "Created agent", agent: @agent
  end

  def update
    if current_user.update_new_email!(@new_email)
      ahoy.track "Updated agent email", agent: current_user
      # SEND EMAIL HERE
      render json: { status: "Email Confirmation has been sent to your new email." }, status: :ok
    else
      ahoy.track "Failed to update agent email", agent: current_user
      render json: { errors: current_user.errors.values.flatten.compact }, status: :bad_request
    end
  end

  def destroy
    # Don't actually delete the agent, just mark them as inactive (for data reasons)
    # ative is a feild in the database under the agents table
    @agent = Agent.find(params.require(:id))
    @agent.active = false
    @agent.save!
    ahoy.track "Deleted agent", agent: @agent
  end

  private

  # Using a private method to encapsulate the permissible parameters
  # is just a good pattern since you'll be able to reuse the same
  # permit list between create and update. Also, you can specialize
  # this method with per-agent checking of permissible attributes.
  def agent_params
    params.require(:agent).permit(:full_name, :email, :password, :codename)
    # params.require(:agent).permit(:first_name, :last_name, :email)
  end

  def validate_email_update
    @new_email = params[:email].to_s.downcase

    if @new_email.blank?
      return render json: { status: "Email cannot be blank" }, status: :bad_request
    end

    if @new_email == current_user.email
      return render json: { status: "Current Email and New email cannot be the same" }, status: :bad_request
    end

    if Agent.email_used?(@new_email)
      render json: { error: "Email is already in use." }, status: :unprocessable_entity
    end
  end

end
