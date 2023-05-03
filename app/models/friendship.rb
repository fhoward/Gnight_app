class Friendship < ApplicationRecord
  belongs_to :users, class_name: "User", foreign_key: "user_id"
  belongs_to :friends ,class_name: 'User', foreign_key: "friend_id"
end
