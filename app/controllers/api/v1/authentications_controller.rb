class Api::V1::AuthenticationsController < ApplicationController

    def login
      @user = User.find_by(name: params[:name])
      if @user
        token = JsonWebToken.encode(user_id: @user.id)
        time = Time.now + 1.hours.to_i
        render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                       name: @user.name }, status: :ok
      else
        render json: { error: 'unauthorized' }, status: :unauthorized
      end
    end

    private
  
    def login_params
      params.permit(:name)
    end
end