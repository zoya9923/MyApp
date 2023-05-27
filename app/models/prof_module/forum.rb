module ProfModule   
    class Forum < ApplicationRecord
        # has_many :comments
        has_many :comments, as: :commentable
    end
end
