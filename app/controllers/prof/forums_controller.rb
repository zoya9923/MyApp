module Prof
    class ForumsController < ApplicationController
        def create
            forum = Forum.new(forum_params)
            if forum.save
                render json: forum
            else 
                render json: {error: 'forum not insert'}
            end
        end

        def index
            forums = Forum.all
            render json: forums
        end








        private
        def forum_params
            params.require(:forum).permit(:forum_title, :forum_name)
        end 
    end
end