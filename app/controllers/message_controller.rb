# frozen_string_literal: true

class MessageController < ApplicationController
  def view
    @message = Message.find(params[:id])

    if @message.read == false
      @message.read = true
      @message.save
    end

  end

end
