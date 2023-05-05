class Api::V1::FeedsController < ApplicationController
    before_action :authorize_request
   
    def index
        #  sleep records of a user's All friends from the previous week,
        #  which are sorted based on the duration of All friends sleep length.
        attendances = Attendance.select("*,ROUND((JULIANDAY(time_out) - JULIANDAY(time_in)) * 86400) AS difference")
                        .where("user_id IN (?) AND (created_at BETWEEN ? AND ?)",@current_user.friends.ids << @current_user.id,1.week.ago,Time.now)
                        .order(:difference)
        render json: FeedListSerializer.new(attendances).serializable_hash.to_json, status: :ok
    end

    def my_feed
        # Clock In operation, and return all clocked-in times, ordered by created time
        attendance = @current_user.attendances.order(:created_at, :asc)
        render json: FeedSerializer.new(attendance).serializable_hash.to_json, status: :ok
    end


end