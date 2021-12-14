class FriendshipsController < ApplicationController
    def destroy
        friendship = Friendship.where(user_id: current_user.id, friend_id: params[:id]).first
        friendship.destroy
        flash[:notice] = "user is not followed anymore"
        redirect_to friends_path
    end

    def create
        current_user.friendships.build(friend_id: params[:friend])
        if current_user.save
            flash[:notice] = "Following user"
        else
            flash[:alert] = " There was something wrong with this tracking request"
        end
        redirect_to friends_path
    end
end