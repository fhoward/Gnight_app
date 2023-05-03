class User < ApplicationRecord
    has_many :attendances
    has_many :friendships
    has_many :friends, through: :friendships
    validates :name, presence: true, uniqueness: true
end
