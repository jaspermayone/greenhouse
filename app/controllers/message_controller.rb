# frozen_string_literal: true

class MessageController < ApplicationController
  before_action :set_message, only: [:view]
  before_action :authorize_user, only: [:view]

  def view
      if @message.read == false
        @message.update(read: true)
      end
  end

  private

  def set_message
    @message = Message.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    # Handle the case where the message does not exist
    redirect_to root_path, alert: "Message not found"
  end

  def authorize_user
    unless current_user.admin? || @message.agent_id == current_user.id
      redirect_to root_path, alert: "You are not authorized to view this message"
    end
  end

end
