class Api::V1::UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]
    def index
        @users = User.all
        render json: @users
    end
    
    def show
        render json: @user
    end
    
    def create
        
    end
     
    def update
        @user.update_attributes(user_params)
        render json: @user 
    end
    
    def destroy
        @user.destroy
        render json: 'Success Delete'
    end

    private

    def set_user
        @user = User.find(params[:id])
        
    end
    
    def user_params
        params.require(:user).permit(:name)
    end

end
