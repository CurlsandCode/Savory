class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body
  has_one :recipe
  has_one :user
end
