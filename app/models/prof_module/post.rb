module ProfModule	
	class Post < ApplicationRecord
		# has_many :comments
		# has_many :post_comments
		has_many :comments, as: :commentable
	end
end
