class AttendanceSerializer
  include JSONAPI::Serializer
  attributes :user_id, :time_in, :time_out, :created_at, :updated_at
end
