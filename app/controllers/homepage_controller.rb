class HomepageController < ApplicationController

  def index
    @post = Post.search(params,0)
  end
end
