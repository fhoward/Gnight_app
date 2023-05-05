class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :created_at, :updated_at

  attribute :attendances do |object|
    object.attendances.order(created_at: :asc)
  end

  attribute :friends
end
