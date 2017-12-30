class VoteSerializer < ActiveModel::Serializer
  attributes :id, :votable_type, :vote_flag
	has_one :recipe
	has_one :user
end
