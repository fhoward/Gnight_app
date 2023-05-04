class User < ApplicationRecord
    has_many :attendances
    has_and_belongs_to_many :friends,
        class_name: "User", 
        join_table: :friends_users, 
        foreign_key: :user_id, 
        association_foreign_key: :friend_id
    validates :name, presence: true, uniqueness: true

end
