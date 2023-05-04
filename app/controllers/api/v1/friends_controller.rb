class Api::V1::FriendsController < ApplicationController
    before_action :authorize_request

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
    
    end

    def unfollow

    end


end