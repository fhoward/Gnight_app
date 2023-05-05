class FriendSerializer
  include JSONAPI::Serializer
  attributes :name

  belongs_to :user
  has_many :attendances
end
