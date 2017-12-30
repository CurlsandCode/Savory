class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :created_at, :user
	has_one :recipe
	has_one :user
	
	def user
		return object.user.username
	end
end
