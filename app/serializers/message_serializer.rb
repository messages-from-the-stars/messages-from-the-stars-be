class MessageSerializer
  include JSONAPI::Serializer

  attributes :satellite_id, :start_lat, :start_lng, :content, :created_at, :updated_at
end