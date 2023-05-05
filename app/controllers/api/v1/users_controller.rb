class Api::V1::UsersController < ApplicationController
    before_action :authorize_request, except: :create
    before_action :set_user, only: [:show, :update, :destroy]

    def index
        @users = User.all
        render json: UserSerializer.new(@users).serializable_hash.to_json, status: :ok
    end
    
    def show 
        render json: UserSerializer.new(@user).serializable_hash.to_json, status: :ok
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            render json: UserSerializer.new(@user).serializable_hash.to_json, status: :created
        else
            render json: @user.errors.full_messages, status: :unprocessable_entity
        end
    end
     
    def update
        if @user.update(user_params)
            render json: UserSerializer.new(@user).serializable_hash.to_json,status: :ok
        else
            render json: @user.errors.full_messages, status: :unprocessable_entity
        end
    end
    
    def destroy
        @user.destroy
        render json: 'Success Delete',status: :ok
    end

    private

    def set_user
        @user = User.find(params[:id])
    end
    
    def user_params
        params.require(:user).permit(:name)
    end

end
