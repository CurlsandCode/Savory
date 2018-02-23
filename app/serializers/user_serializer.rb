class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :bio, :avatar
  has_many :comments
  has_many :recipes
  has_many :votes
end
