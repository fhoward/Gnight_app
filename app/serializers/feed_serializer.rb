class FeedSerializer
  include JSONAPI::Serializer
  attributes :time_in, :time_out, :created_at
  attribute :users
end
