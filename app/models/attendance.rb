class Attendance < ApplicationRecord
  belongs_to :users, class_name: "User", foreign_key: "user_id"
  validates :time_in, presence: true

  # attr_accessor :hour_length

  # def hour_length
  #    ((time_out - time_in) * 86400).round rescue 0
  # end


end
