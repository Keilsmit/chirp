class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :api_token, :avatar


end
