class UserListSerializer
  include JSONAPI::Serializer
  attributes :id, :name
end
