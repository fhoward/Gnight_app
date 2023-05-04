class User < ApplicationRecord
    has_many :attendances
    has_and_belongs_to_many :friends,
        class_name: "User", 
        join_table: :friends_users, 
        foreign_key: :user_id, 
        association_foreign_key: :friend_id
    validates :name, presence: true, uniqueness: true

    def follow_friend(friend)
        if self != friend && !friends.include?(friend)
            friends << friend 
        else
            errors.add("Error on adding friend")
        end
    end

    def unfollow_friend(friend)
        friends.delete(friend)
    end

    def friends?(user)
        friends.include?(user)
    end

end
