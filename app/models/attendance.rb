class Attendance < ApplicationRecord
  belongs_to :users, class_name: "User", foreign_key: "user_id"
  validates :time_in, presence :true
end
