module Prof
    class CommentsController < ApplicationController

        def create
            comment = ProfModule::Comment.new(comment_params)
            if comment.save
                render json: comment
            else 
                render json: {error: 'Comment not insert'}
            end
        end

        def index
        
            case params[:type]
            when "post"
                comments = ProfModule::Comment.where(commentable_type: "Post")
            when "forum"
                comments = ProfModule::Comment.where(commentable_type: "Forum")
            when "event"
                comments = ProfModule::Comment.where(commentable_type: "Event")
            else
             
                comments = ProfModule::Comment.all
            end
                render json: comments
        end

        private
        def comment_params
            params.require(:comment).permit(:content, :commentable_id, :commentable_type)
        end
    end
end