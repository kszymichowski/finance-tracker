class FriendshipsController < ApplicationController
    def destroy
        friend = User.find(params[:id])
        friendship = Friendship.where(user_id: current_user.id, friend_id: friend.id).first
        friendship.destroy
        flash[:notice] = "#{friend.email} is not followed anymore"
        redirect_to friends_path
    end
end