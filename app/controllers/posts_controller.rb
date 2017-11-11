class PostsController < ApplicationController
respond_to :js, :json, :html
before_action :authenticate_user!, except: [:index,:show]
    def index
        @posts = Post.search(params)
    end

    def new
        @posts = Post.new
    end
    def show
        @posts = Post.find(params[:id])
    end
    def create
        @posts = Post.new(posts_params)
        if @posts.save
            redirect_to posts_path
        else
            render template '/posts/new'
        end
    end
    def vote
      if !current_user.liked? @posts
        @posts.liked_by current_user
      elsif current_user.like? @posts
        @post.unlike_by current_user
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