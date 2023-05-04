class Api::V1::FriendsController < ApplicationController
    before_action :authorize_request
    before_action :set_friend, only: [:follow, :unfollow]
    def index
        # list all users
        @friends = User.where.not(id: @current_user.id)
        render json: @friends, status: :ok
    end

    def list_all_friends
        # list followed friends
        @friends = @current_user.friends
        render json: @friends, status: :ok
    end

    def follow
        @current_user.follow_friend(@friend)
        if !@current_user.errors.any?
            render json: @friend, status: :created
        else
            render json: @current_user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def unfollow
        friend = @current_user.unfollow_friend(@friend) if @current_user.friends?(@friend)
        if friend.present?
            render json: "Success Unfollow", status: :ok
        else
            render json: "Error on unfollowing friend",status: :unprocessable_entity
        end
    end

    private
    def set_friend
        @friend = User.find(params[:friend_id]) 
    end

end