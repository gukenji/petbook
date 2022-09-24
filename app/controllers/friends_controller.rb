class FriendsController < ApplicationController
  after_action :delete_invite, only: :create

  def create
    @profile = current_user
    @friend = @profile.friends.build(friends_params)   
     respond_to do |format|
      if @friend.save!
        format.html { redirect_to request.referrer, notice: 'Amizade iniciada com sucesso!' }
        format.json { render :show, status: :created, location: @friend }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @friend = Friend.find(params[:id])
    @friend.destroy
    respond_to do |format|
      format.html { redirect_to request.referrer, notice: 'Amizade desfeita com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
  def friends_params
    params.permit(:friend_id, :user_id)
  end

  private
  def delete_invite
    @invite = Invitation.where(invited_user_id: @friend.friend_id, requesting_user_id: @friend.user_id)
    .or(Invitation.where(invited_user_id: @friend.user_id, requesting_user_id: @friend.friend_id))
    @invite.delete_all
  end
end


