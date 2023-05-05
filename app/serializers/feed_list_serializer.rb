class FeedListSerializer
  include JSONAPI::Serializer
  attributes :time_in, :time_out, :difference, :created_at
  attribute :users
end
