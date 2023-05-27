module ProfModule
	class Comment < ApplicationRecord
		# belongs_to post
		# belongs_to event
		# belongs_to forum
		belongs_to :commentable, polymorphic: true
	end
end
