class Api::V1::AttendancesController < ApplicationController
    before_action :authorize_request

    def clock_in
        # check the last clocked in of user where time_out is null
        last_clock_in = @current_user.attendances.where(time_out: nil).last
        # if user has no exisiting records of time in to clock out
        if last_clock_in.nil? 
            time_in = @current_user.attendances.create(time_in: Time.now)
            render json: time_in,status: :created
        # if not
        else
            render json: 'You have existing clock in record and forgot to clock out', status: :bad_request
        end
    end
    
    def clock_out
        # check the last clocked in of user where time_out is null
        last_clock_in = @current_user.attendances.where(time_out: nil).last
        # if user already clock out
        if last_clock_in.nil? 
            render json: 'You have no existing records to clock out', status: :bad_request
        else
            last_clock_in.update(time_out: Time.now)
            render json: last_clock_in,status: :ok
        end
    end
end
