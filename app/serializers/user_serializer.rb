class UserSerializer
  include JSONAPI::Serializer
  attributes :name, :username
end