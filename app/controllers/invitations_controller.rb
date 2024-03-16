class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(invitation_params)
    @invitation.sender_id = current_user.id
    if @invitation.save
      # SEND EMAIL
      flash[:success] = "Invitation sent."
      redirect_to root_entry_path
    else
      render :new
    end
  end
end
