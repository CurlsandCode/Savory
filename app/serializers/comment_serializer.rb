class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :created_at
	has_one :recipe
	has_one :user
	
	
	def created_at
		return object.created_at.strftime("%d %b %y") 
	end
end

