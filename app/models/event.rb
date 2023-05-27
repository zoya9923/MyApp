#module ProfModule    
   class Event < ApplicationRecord
        # has_many :comments
        has_many :comments, as: :commentable
    end
#end
