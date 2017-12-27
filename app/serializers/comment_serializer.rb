class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :created_at
	has_one :recipe
	has_one :user
end
