module Prof
    class PostsController < ApplicationController

        def create
            post = ProfModule::Post.new(post_params)
            if post.save
                render json: PostSerializer.new(post).serializable_hash, status: 200
            else 
                render json: {error: 'post not insert'}
            end
        end

        def index
            posts = ProfModule::Post.all
            render json: posts
        end


        private
        def post_params
            params.require(:post).permit(:post_title, :description)
        end 
    end
end