class User < ApplicationRecord
    has_many :attendances
    validates :name, presence: true, uniqueness: true
end
