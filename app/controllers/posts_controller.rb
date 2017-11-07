class PostsController < ApplicationController

    def index
        @posts = Post.search(params,0)
        respond_to do |format|
            format.json { render json: @posts }
            format.html {}
        end
    end

    def new
        @posts = Post.new
    end

    def create
        @posts = Post.new(posts_params)
        if @posts.save
            redirect_to posts_path
        else
            render template '/posts/new'
        end
    end
private
    def posts_params
        params.require(:post)
              .permit(
                  :description,
                  :picture,
                  :category_id,
                  tag_ids: []
              ).merge(user_id: current_user.id)
    end
end