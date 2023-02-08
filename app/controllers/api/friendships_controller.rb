class Api::FriendshipsController < ApplicationController
    # before_action :require_logged_in

    def create
        debugger
        @friendship = Friendship.new(user_id: params[:user_id], friend_id: params[:friend_id])
        if @friendship.save
        else
            render json: ["Already friended"], status: 418
        end
    end

    def destroy
        @target_friendship = Friendship.find_by(id: params[:id])
        @other_side = Friendship.find_by(user_id: @target_friendship.friend_id, friend_id: @target_friendship.user_id)
        @target_friendship.destroy if @target_friendship
        @other_side.destroy if @other_side
    end 
end